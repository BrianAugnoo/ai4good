class MigrateEtablishedToEstablishments < ActiveRecord::Migration[7.1]
  def up
    Group.reset_column_information

    Group.find_each do |group|
      next if group.etablished.blank?

      est = Establishment.find_or_create_by(name: group.etablished)
      group.update_column(:establishment_id, est.id)
    end
  end
end
