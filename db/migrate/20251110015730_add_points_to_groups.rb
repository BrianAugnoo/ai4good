class AddPointsToGroups < ActiveRecord::Migration[8.0]
  def change
    add_column :groups, :points, :float, default: 0.0
  end
end
