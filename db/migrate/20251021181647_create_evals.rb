class CreateEvals < ActiveRecord::Migration[8.0]
  def change
    create_table :evals do |t|
      t.boolean :done
      t.references :examiner, null: false, foreign_key: true
      t.references :session, null: false, foreign_key: true

      t.timestamps
    end
  end
end
