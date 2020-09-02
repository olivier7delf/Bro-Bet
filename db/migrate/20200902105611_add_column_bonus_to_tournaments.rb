class AddColumnBonusToTournaments < ActiveRecord::Migration[6.0]
  def change
    add_column :tournaments, :bonus, :boolean, default: false
  end
end
