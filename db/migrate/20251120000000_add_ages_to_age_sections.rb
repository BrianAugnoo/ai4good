class AddAgesToAgeSections < ActiveRecord::Migration[7.1]
  def change
    add_column :age_sections, :ages, :string
  end
end
