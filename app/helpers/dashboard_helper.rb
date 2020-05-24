module DashboardHelper
	def calc_kelompok_percentage(desa, total_of_kelompoks)
		(desa.kelompoks.size.to_f/total_of_kelompoks)*100
	end
end