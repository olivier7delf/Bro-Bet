class CreateTournaments < ActiveRecord::Migration[6.0]
  def change
    create_table :tournaments do |t|
      t.string :title
      t.string :description
      t.string :stake
      t.datetime :closed_at
      t.datetime :resulted_at
      t.integer :max_bets_number
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
