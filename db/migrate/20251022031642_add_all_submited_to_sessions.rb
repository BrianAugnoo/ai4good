class AddAllSubmitedToSessions < ActiveRecord::Migration[8.0]
  def change
    add_column :sessions, :all_submited, :boolean, default: false
  end
end
