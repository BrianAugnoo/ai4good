class ChangeStatuses < ActiveRecord::Migration[8.0]
  def change
    change_column :statuses, :first_rate, :boolean, default: false
    change_column :statuses, :second_rate, :boolean, default: false
    change_column :statuses, :edit_rate, :boolean, default: false
  end
end
