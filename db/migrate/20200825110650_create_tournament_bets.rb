class CreateTournamentBets < ActiveRecord::Migration[6.0]
  def change
    create_table :tournament_bets do |t|
      t.references :tournament, null: false, foreign_key: true
      t.references :bet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
