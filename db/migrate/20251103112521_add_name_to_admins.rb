class AddNameToAdmins < ActiveRecord::Migration[8.0]
  def change
    add_column :admins, :name, :string, default: "Default"
  end
end
