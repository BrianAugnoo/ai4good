class CreateAgeSections < ActiveRecord::Migration[8.0]
  def change
    create_table :age_sections do |t|
      t.integer :value

      t.timestamps
    end
  end
end
