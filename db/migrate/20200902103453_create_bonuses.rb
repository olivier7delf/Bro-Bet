class CreateBonuses < ActiveRecord::Migration[6.0]
  def change
    create_table :bonuses do |t|
      t.string :title
      t.string :description
      t.integer :level
      t.float :probability

      t.timestamps
    end
  end
end
