class AddCategoryToCriteriums < ActiveRecord::Migration[8.0]
  def change
    add_reference :criteria, :criterium_category, null: false, foreign_key: true
  end
end
