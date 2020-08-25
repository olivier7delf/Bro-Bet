class CreateBetParticipations < ActiveRecord::Migration[6.0]
  def change
    create_table :bet_participations do |t|
      t.references :bet, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :user_choice

      t.timestamps
    end
  end
end
