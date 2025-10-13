class ChangeCoeffsInCriteria < ActiveRecord::Migration[8.0]
  def change
    change_column :criteria, :coeffs, :integer, default: 1
  end
end
