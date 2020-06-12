class BaseController < ApplicationController
  layout 'admin'

  add_breadcrumb "<b>BERANDA</b>".html_safe, :root_path
	
  before_action :authenticate_user!
  before_action :load_parent_variables, :load_category_variables, only: [:index, :show]

  private

  def load_parent_variables
    @desas = Desa.includes(:kelompoks, :people).order(:name)
    @number_of_kelompoks   = Kelompok.count
    @number_of_people      = Person.count
    @desa_names            = @desas.map{ |desa| desa.name }
    @desa_names_and_people = @desas.map{ |desa| "#{desa.name} : #{desa.people.size} Jiwa" }
    @desa_abrs             = @desas.map{ |desa| desa.abr }
    @person_each_desa      = @desas.map{ |desa| desa.people.size }
    @kelompoks_each_desa   = @desas.map{ |desa| desa.kelompoks.size }
    @male_each_areas       = @desas.map{ |desa| desa.male_person.count }
    @female_each_areas     = @desas.map{ |desa| desa.female_person.count }

    gon.push({
      desa_names: @desa_names,
      desa_names_and_people: @desa_names_and_people,
      desa_abrs: @desa_abrs,
      person_each_desa: @person_each_desa,
      number_of_people: @number_of_people,
      kelompoks_each_desa: @kelompoks_each_desa,
      total_kelompok: @number_of_kelompoks,
      sex: SEX_LIST.values,
      male_each_areas: @male_each_areas,
      female_each_areas: @female_each_areas
    })
  end

  def load_category_variables
    @female_all, @male_all                 = PersonFilter.new(category: 'all').run
    @female_balitas, @male_balitas         = PersonFilter.new(category: 'balita').run
    @female_caberawits, @male_caberawits   = PersonFilter.new(category: 'caberawit').run
    @female_pra_remajas, @male_pra_remajas = PersonFilter.new(category: 'pra_remaja').run
    @female_remajas, @male_remajas         = PersonFilter.new(category: 'remaja').run
    @female_muda_mudis, @male_muda_mudis   = PersonFilter.new(category: 'muda_mudi').run
    @female_pembinas, @male_pembinas       = PersonFilter.new(category: 'pembina').run
    @female_lansias, @male_lansias         = PersonFilter.new(category: 'lansia').run

    gon.push({
      female_all: @female_all.size,
      male_all: @male_all.size,
      female_balitas: @female_balitas.size,
      male_balitas: @male_balitas.size,
      female_caberawits: @female_caberawits.size,
      male_caberawits: @male_caberawits.size,
      female_pra_remajas: @female_pra_remajas.size,
      male_pra_remajas: @male_pra_remajas.size,
      female_remajas: @female_remajas.size,
      male_remajas: @male_remajas.size,
      female_muda_mudis: @female_muda_mudis.size,
      male_muda_mudis: @male_muda_mudis.size,
      female_pembinas: @female_pembinas.size,
      male_pembinas: @male_pembinas.size,
      female_lansias: @female_lansias.size,
      male_lansias: @male_lansias.size
    })
  end
end
