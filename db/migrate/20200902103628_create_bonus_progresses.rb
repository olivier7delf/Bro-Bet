class CreateBonusProgresses < ActiveRecord::Migration[6.0]
  def change
    create_table :bonus_progresses do |t|
      t.references :bonuse, null: false, foreign_key: true
      t.references :bet, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :tournament, null: false, foreign_key: true
      t.string :progress

      t.timestamps
    end
  end
end
