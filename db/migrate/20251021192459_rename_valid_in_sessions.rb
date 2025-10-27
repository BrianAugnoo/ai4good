class RenameValidInSessions < ActiveRecord::Migration[8.0]
  def change
    rename_column :sessions, :valid, :is_valid
  end
end
