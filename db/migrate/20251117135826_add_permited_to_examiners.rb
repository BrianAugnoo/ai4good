class AddPermitedToExaminers < ActiveRecord::Migration[8.0]
  def change
    add_column :examiners, :permited, :boolean, default: false
  end
end
