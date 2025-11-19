class CreateCriteriaNames < ActiveRecord::Migration[8.0]
  def change
    create_table :criteria_names do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
