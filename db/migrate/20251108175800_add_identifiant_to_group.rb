class AddIdentifiantToGroup < ActiveRecord::Migration[8.0]
  def change
    add_column :groups, :indentifiant, :string, limit: 5, default: -> { "substring(md5(random()::text) for 5)" }
  end
end
