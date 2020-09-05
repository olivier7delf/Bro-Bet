class TournamentParticipationsController < ApplicationController
  def index
    @tournament = Tournament.find(params["tournament_id"])
    @participations = @tournament.tournament_participations.order(score: :desc)

    # query = "
    # WITH table_tournament_bets AS (
    #   SELECT
    #     DISTINCT tb.bet_id bet_id
    #   FROM tournament_bets tb
    #   WHERE tb.tournament_id = #{@tournament.id}
    # )
    # SELECT
    #     bets.id id,
    #     bets.result result
    #   FROM bets
    #   JOIN bet_participations ON bets.id = bet_participations.bet_id
    #   JOIN table_tournament_bets tbt ON bets.id = tbt.bet_id
    #   WHERE
    #   -- bet_participations.user_id = #{current_user.id} AND
    #      bets.result = bet_participations.user_choice
    # "
    # result = ActiveRecord::Base.connection.execute(query)
    # raise
    @participations_ori = TournamentParticipationsController.get_participations(@tournament)
    @participations_bonus = TournamentParticipationsController.get_participations_bonus(@tournament)

    @participations = []
    @participations_ori.each do |participation|
      if @participations_bonus.count > 0
        participation["score"] += @participations_bonus.select { |p| p["nickname"] == participation["nickname"] }.first["impact_score"] || 0
      end
      @participations << participation

      # raise
    end
    @participations.sort_by! { |p| -p["score"] }
  end

  def self.get_participations(tournament)
    query = "
    WITH table_tournament_bets AS (
      SELECT
        DISTINCT tb.bet_id bet_id
      FROM tournament_bets tb
      WHERE tb.tournament_id = #{tournament.id}
    )

    SELECT
      u.id id,
      u.nickname nickname,
      SUM(
        CASE WHEN b.user_choice = b.result THEN 1 ELSE 0 END
      ) * 3 score
    FROM (
      SELECT
        bets.id id,
        bets.result result,
        bet_participations.user_choice user_choice,
        bet_participations.user_id user_id
      FROM bets
      JOIN bet_participations ON bets.id = bet_participations.bet_id
      JOIN table_tournament_bets tbt ON bets.id = tbt.bet_id

    ) b
    JOIN users u
      ON b.user_id = u.id

    GROUP BY u.id, u.nickname
    ORDER BY score DESC
    "
    participations = ActiveRecord::Base.connection.execute(query)
  end

  def self.get_participations_bonus(tournament)
    query = "
    WITH table_tournament_bets AS (
      SELECT
        DISTINCT tb.bet_id bet_id
      FROM tournament_bets tb
      WHERE tb.tournament_id = #{tournament.id}
    )
    , table_tournament_users AS (
      SELECT
        DISTINCT tp.user_id user_id
      FROM tournament_participations tp
      WHERE tp.tournament_id = #{tournament.id}
    )

    SELECT
      u.id id,
      u.nickname nickname,
      SUM(impact_score) impact_score
    FROM (
      SELECT
        bg.bet_id bet_id,
        bg.user_id user_id,
        bg.impact_score impact_score
      FROM bonus_progresses bg
      JOIN table_tournament_bets ttb ON bg.bet_id = ttb.bet_id
      JOIN table_tournament_users ttu ON bg.user_id = ttu.user_id
    ) b
    JOIN users u
      ON b.user_id = u.id

    GROUP BY u.id, u.nickname
    ORDER BY impact_score DESC
    "
    participations_impact = ActiveRecord::Base.connection.execute(query)
    return participations_impact
  end

  def create
    @tournament = Tournament.find(params["tournament_id"])
    tp = TournamentParticipation.new(tournament_id: params[:tournament_id])
    tp.tournament = @tournament
    tp.user = current_user
    tp.save
    redirect_to tournament_path(@tournament)
  end

  private

  # def tournament_participation_params
  #   params.require(:tournament_participation).permit(:score)
  # end
end
