class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
    	t.integer :kelompok_id
    	t.string :fullname
    	t.string :nickname
    	t.string :address
    	t.string :place_of_birth
    	t.datetime :date_of_birth
    	t.integer :blood_type
    	t.integer :status
    	t.string :phone_number
    	t.integer :sex
    	t.string :education
    	t.string :expertise
    	t.string :slug

      t.timestamps
    end

    add_index :people, :slug, unique: true
  end
end
