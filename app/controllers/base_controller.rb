class BaseController < ApplicationController
	layout 'admin'

	add_breadcrumb "<b>BERANDA</b>".html_safe, :root_path
	
	before_action :authenticate_user!
	before_action :load_parent_variables, only: [:index, :show]

	private

	def load_parent_variables
	  @desas = Desa.includes(:kelompoks, :people).order(:name)
    @number_of_kelompoks = Kelompok.count

    gon.push({
    	:desa_names => @desas.map{ |desa| desa.name },
    	:desa_abrs => @desas.map{ |desa| desa.abr },
    	:person_each_desa => @desas.map{ |desa| desa.people.size },
    	:total_person => Person.count,
    	:kelompoks_each_desa => @desas.map{ |desa| desa.kelompoks.size },
    	:total_kelompok => @number_of_kelompoks
    })
	end
end
