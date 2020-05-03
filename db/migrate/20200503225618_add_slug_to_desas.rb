class AddSlugToDesas < ActiveRecord::Migration[5.2]
  def change
    add_column :desas, :slug, :string
    add_index :desas, :slug, unique: true
  end
end
