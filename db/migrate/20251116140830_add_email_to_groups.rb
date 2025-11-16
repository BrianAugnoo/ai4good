class AddEmailToGroups < ActiveRecord::Migration[8.0]
  def change
    add_column :groups, :email, :string
  end
end
