class CreateKelompoks < ActiveRecord::Migration[5.2]
  def change
    create_table :kelompoks do |t|
    	t.integer :desa_id
    	t.string :name
    	t.string :address
    	t.string :type
    	t.string :slug

      t.timestamps
    end

    add_index :kelompoks, :slug, unique: true
  end
end
