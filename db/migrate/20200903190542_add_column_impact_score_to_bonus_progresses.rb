class AddColumnImpactScoreToBonusProgresses < ActiveRecord::Migration[6.0]
  def change
    add_column :bonus_progresses, :impact_score, :integer
  end
end
