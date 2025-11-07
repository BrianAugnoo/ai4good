class ChangeGroups < ActiveRecord::Migration[8.0]
  def change
    add_column :groups, :first_rate, :boolean, default: false
    add_column :groups, :second_rate, :boolean, default: false
    add_column :groups, :note_totals, :float, default: 0.0
  end
end
