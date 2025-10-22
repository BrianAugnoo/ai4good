class ChangeIsValidInSession < ActiveRecord::Migration[8.0]
  def change
    change_column :sessions, :is_valid, :boolean, default: false
  end
end
