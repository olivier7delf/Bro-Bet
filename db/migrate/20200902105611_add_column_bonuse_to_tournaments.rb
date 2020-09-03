class AddColumnBonuseToTournaments < ActiveRecord::Migration[6.0]
  def change
    add_column :tournaments, :bonuse, :boolean, default: false
  end
end
