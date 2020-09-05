class UsersController < ApplicationController
  def show
    @bets_winned = count_my_victories
    @level = (@bets_winned ** 0.5).to_i
    @bets_finished = count_bets_finished
    @bets_played = current_user.bet_participations.joins(:bet).length
    @bets_created = current_user.bets.count()
    @ratio_victory = @bets_finished == 0 ? 0 : (100 * @bets_winned / @bets_finished).to_i
    @bro4life = find_bro4life[0]
    @bro4life_bets = find_bro4life[1]
    @golden_bro = find_golden_bro[0]
    @golden_bro_bets = find_golden_bro[1]
    @poop_bro = count_poop_bro[0]
    @poop_bro_bets = count_poop_bro[1]
  end

  private

  def count_my_victories
    # Mix active record and ruby !! caution the result seems wrong
    # current_user.bet_participations.count { |p| p.user_choice = p.bet.result }
    # Mix active record and SQL query
    current_user.bet_participations.joins(:bet).where("bets.result = bet_participations.user_choice").length
  end

  def count_bets_finished
    # Mix active record and ruby !! caution the result seems wrong
    # current_user.bet_participations.count { |p| p.user_choice = p.bet.result }
    # Mix active record and SQL query
    current_user.bet_participations.joins(:bet).where("bets.result IN (true, false)").length
  end

  def find_bro4life
    # -Tu paries le plus avec : Bro 4 life
    query = "
    SELECT
      u.nickname nickname,
      COUNT(*) bets
    FROM (
      SELECT
        bets.id id,
        bets.result result
      FROM bets
      JOIN bet_participations ON bets.id = bet_participations.bet_id
      WHERE bet_participations.user_id = #{current_user.id}
    ) b
    JOIN bet_participations bp
      ON b.id = bp.bet_id
    JOIN users u
      ON bp.user_id = u.id
    WHERE u.id != #{current_user.id}
    GROUP BY u.nickname
    ORDER BY bets DESC
    "
    result = ActiveRecord::Base.connection.execute(query)
    if result.to_a.empty?
      return [0, 0]
      # @bro4life = 0
      # @bro4life_bets = 0
    else
      return [result[0]["nickname"], result[0]["bets"]]
      # @bro4life = result[0]["nickname"]
      # @bro4life_bets = result[0]["bets"]
    end
  end

  def find_golden_bro
    # -Tu paries le plus avec : Bro 4 life
    query = "
    SELECT
      u.nickname nickname,
      SUM(
        CASE WHEN bp.user_choice = b.result THEN 1 ELSE 0 END
      ) victories
    FROM (
      SELECT
        bets.id id,
        bets.result result
      FROM bets
      JOIN bet_participations ON bets.id = bet_participations.bet_id
      WHERE bet_participations.user_id = #{current_user.id}
        AND bets.result = bet_participations.user_choice
    ) b
    JOIN bet_participations bp
      ON b.id = bp.bet_id
    JOIN users u
      ON bp.user_id = u.id
    WHERE u.id != #{current_user.id}
    GROUP BY u.nickname
    ORDER BY victories DESC
    "

    result = ActiveRecord::Base.connection.execute(query)
    if result.to_a.empty?
      return ["xXx", 0]
      # @golden_bro = 0
      # @golden_bro_bets = 0
    else
      return [result[0]["nickname"], result[0]["victories"]]
      # @golden_bro = result[0]["nickname"]
      # @golden_bro_bets = result[0]["victories"]
    end
  end

  def count_poop_bro
    query = "
    SELECT
      u.nickname nickname,
      SUM(
        CASE WHEN bp.user_choice != b.result THEN 1 ELSE 0 END
      ) defeats
    FROM (
      SELECT
        bets.id id,
        bets.result result
      FROM bets
      JOIN bet_participations ON bets.id = bet_participations.bet_id
      WHERE bet_participations.user_id = #{current_user.id}
        AND bets.result = bet_participations.user_choice
    ) b
    JOIN bet_participations bp
      ON b.id = bp.bet_id
    JOIN users u
      ON bp.user_id = u.id
    WHERE u.id != #{current_user.id}
    GROUP BY u.nickname
    ORDER BY defeats DESC
    "
    result = ActiveRecord::Base.connection.execute(query)
    if result.to_a.empty?
      return ["xXx", 0]
    else
      return [result[0]["nickname"], result[0]["defeats"]]
      # @poop_bro = result[0]["nickname"]
      # @poop_bro_bets = result[0]["defeats"]
    end
    # current_user.bets.joins(:bet_participations).where("bets.result = bet_participations.user_choice")

    # mes victoires : current_user.bets.joins(:bet_participations).where("bets.result = bet_participations.user_choice")
  end
end

# "\n    SELECT\n      u.nickname nickname,\n
# SUM(\n        CASE WHEN bp.user_choice != b.result THEN 1 ELSE 0 END\n      ) defeats\n
#    FROM (\n
#      SELECT\n        *\n
#      FROM bets\n
#      JOIN bet_participations ON bets.id = bet_participations.bet_id\n
#          WHERE bet_participations.user_id = 3\n      ) b\n
#    JOIN bet_participations bp\n      ON b.id = bp.bet_id\n    JOIN users u\n      ON bp.user_id = u.id\n    GROUP BY u.nickname\n    ORDER BY defeats DESC\n    "
