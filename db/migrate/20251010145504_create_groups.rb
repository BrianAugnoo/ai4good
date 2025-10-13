class CreateGroups < ActiveRecord::Migration[8.0]
  def change
    create_table :groups do |t|
      t.string :etablished
      t.string :name
      t.string :theme

      t.timestamps
    end
  end
end
