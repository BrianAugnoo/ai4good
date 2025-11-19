class ChangeEstablishedIdOnGroups < ActiveRecord::Migration[8.0]
  def change
    change_column_null :groups, :establishment_id, false
  end
end
