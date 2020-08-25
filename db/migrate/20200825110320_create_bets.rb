class CreateBets < ActiveRecord::Migration[6.0]
  def change
    create_table :bets do |t|
      t.string :title
      t.string :description
      t.boolean :result
      t.string :stake
      t.boolean :owner_choice
      t.datetime :closed_at
      t.datetime :resulted_at
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
