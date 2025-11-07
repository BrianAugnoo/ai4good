class CreateStatuses < ActiveRecord::Migration[8.0]
  def change
    create_table :statuses do |t|
      t.boolean :first_rate
      t.boolean :second_rate
      t.boolean :edit_rate

      t.timestamps
    end
  end
end
