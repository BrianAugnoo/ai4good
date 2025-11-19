class AddSendEmailToGroups < ActiveRecord::Migration[8.0]
  def change
    add_column :groups, :send_email, :boolean, default: false
  end
end
