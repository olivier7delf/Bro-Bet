class CreateTournamentParticipations < ActiveRecord::Migration[6.0]
  def change
    create_table :tournament_participations do |t|
      t.references :tournament, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
