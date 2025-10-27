class AddTimerToGroups < ActiveRecord::Migration[8.0]
  def change
    add_column :groups, :timer, :string, default: "0"
  end
end
