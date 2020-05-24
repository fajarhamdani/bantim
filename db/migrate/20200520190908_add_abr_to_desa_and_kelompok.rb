class AddAbrToDesaAndKelompok < ActiveRecord::Migration[5.2]
  def change
  	add_column :desas, :abr, :string
  	add_column :kelompoks, :abr, :string
  end
end
