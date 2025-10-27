class ChangeDoneInEval < ActiveRecord::Migration[8.0]
  def change
    change_column :evals, :done, :boolean, default: false
  end
end
