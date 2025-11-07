class AddSizeToAgeSections < ActiveRecord::Migration[8.0]
  def change
    add_column :age_sections, :size, :string, default: false
  end
end
