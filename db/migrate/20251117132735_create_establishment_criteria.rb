class CreateEstablishmentCriteria < ActiveRecord::Migration[8.0]
  def change
    create_table :establishment_criteria do |t|
      t.string :name
      t.float :values
      t.references :examiner, null: false, foreign_key: true
      t.references :establishment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
