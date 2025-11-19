class RemoveEtablishedFromGroups < ActiveRecord::Migration[8.0]
  def change
    remove_column :groups, :etablished, :string
  end
end
