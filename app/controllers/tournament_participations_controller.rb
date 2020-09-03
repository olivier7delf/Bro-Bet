class TournamentParticipationsController < ApplicationController
  def index
    @tournament = Tournament.find(params["tournament_id"])
    @participations = @tournament.tournament_participations.order(score: :desc)

    query = "
WITH table_tournament_bets AS (
      SELECT
        DISTINCT tb.bet_id bet_id
      FROM tournament_bets tb
      WHERE tb.tournament_id = #{@tournament.id}
    )
    SELECT
        bets.id id,
        bets.result result
      FROM bets
      JOIN bet_participations ON bets.id = bet_participations.bet_id
      JOIN table_tournament_bets tbt ON bets.id = tbt.bet_id
      WHERE
      -- bet_participations.user_id = #{current_user.id} AND
         bets.result = bet_participations.user_choice

    "
    result = ActiveRecord::Base.connection.execute(query)
    # raise

    query = "
    WITH table_tournament_bets AS (
      SELECT
        DISTINCT tb.bet_id bet_id
      FROM tournament_bets tb
      WHERE tb.tournament_id = #{@tournament.id}
    )

    SELECT
      u.id id,
      u.nickname nickname,
      SUM(
        CASE WHEN b.user_choice = b.result THEN 1 ELSE 0 END
      ) score
    FROM (
      SELECT
        bets.id id,
        bets.result result,
        bet_participations.user_choice user_choice,
        bet_participations.user_id user_id
      FROM bets
      JOIN bet_participations ON bets.id = bet_participations.bet_id
      JOIN table_tournament_bets tbt ON bets.id = tbt.bet_id
      -- WHERE
      -- bet_participations.user_id = #{current_user.id} AND
      -- bets.result = bet_participations.user_choice
    ) b
    JOIN users u
      ON b.user_id = u.id
    -- WHERE u.id != #{current_user.id}
    GROUP BY u.id, u.nickname
    ORDER BY score DESC
    "
    @participations = ActiveRecord::Base.connection.execute(query)

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
