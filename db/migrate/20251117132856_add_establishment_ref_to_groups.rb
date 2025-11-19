class AddEstablishmentRefToGroups < ActiveRecord::Migration[8.0]
  def change
    add_reference :groups, :establishment, foreign_key: true
  end
end
