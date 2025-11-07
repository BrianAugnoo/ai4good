class DropEvalsTable < ActiveRecord::Migration[8.0]
  def change
    drop_table :evals
  end
end
