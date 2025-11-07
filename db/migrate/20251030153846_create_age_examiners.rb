class CreateAgeExaminers < ActiveRecord::Migration[8.0]
  def change
    create_table :age_examiners do |t|
      t.references :examiner, null: false, foreign_key: true
      t.references :age_section, null: false, foreign_key: true

      t.timestamps
    end
  end
end
