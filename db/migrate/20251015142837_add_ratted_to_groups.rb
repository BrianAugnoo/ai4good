class AddRattedToGroups < ActiveRecord::Migration[8.0]
  def change
    add_column :groups, :ratted, :boolean, default: false
  end
end
