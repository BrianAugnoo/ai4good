class CreateCriteria < ActiveRecord::Migration[8.0]
  def change
    create_table :criteria do |t|
      t.string :name
      t.integer :coeffs
      t.float :values
      t.references :examiner, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
