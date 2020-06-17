class DesasController < BaseController
  before_action :set_desa, only: [:show, :edit, :update, :destroy]
  
  add_breadcrumb "<b>DESA</b>".html_safe

  # GET /desas
  def index
    @desas = Desa.order(:name)
    @desa  = Desa.new
  end

  # GET /desas/1
  def show
    load_general_variables
    load_category_variables
    
    @kelompoks = @desa.kelompoks.includes(:people).order(:name)
    @desas     = Desa.all.order(:name)
  end

  # GET /desas/1/edit
  def edit
  end

  def new
    @desa = Desa.new
  end

  # POST /desas
  def create
    @desa = Desa.new(desa_params)

    respond_to do |format|
      if @desa.save
        format.html { redirect_to desa_url(@desa), notice: "Desa #{@desa.name} Berhasil Ditambahkan." }
      else
        format.js
      end
    end
  end

  # PATCH/PUT /desas/1
  def update
    respond_to do |format|
      if @desa.update(desa_params)
        format.html { redirect_to root_url, notice: "Desa #{@desa.name} Berhasil Diubah." }
      else
        format.js
      end
    end
  end

  # DELETE /desas/1
  def destroy
    destroyed_desa = @desa.name.capitalize

    @desa.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: "Desa #{destroyed_desa} Berhasil Dihapus." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_desa
      @desa = Desa.friendly.find_by_slug(params[:id])

      if @desa.blank?
        flash[:notice] = 'Desa tidak ditemukan.'
        redirect_to root_url
      end
    end

    # Only allow a list of trusted parameters through.
    def desa_params
      params.require(:desa).permit(:name,:abr)
    end

    def load_general_variables
      @kelompoks             = @desa.kelompoks.includes(:people).order(:name)
      @number_of_people      = @desa.people.size
      @male_each_areas       = @kelompoks.map{ |kelompok| kelompok.male_person.count }
      @female_each_areas     = @kelompoks.map{ |kelompok| kelompok.female_person.count }
      @kelompok_names_and_people = @kelompoks.map{ |kelompok| "#{kelompok.name} : #{kelompok.people.size} Jiwa" }

      gon.push({
        sex: SEX_LIST.values,
        kelompok_names_and_people: @kelompok_names_and_people,
        number_of_people: @number_of_people,
        male_each_areas: @male_each_areas,
        female_each_areas: @female_each_areas
      })
    end

    def load_category_variables
      @female_all, @male_all                 = PersonFilter.new(category: 'all', desa: @desa).run
      @female_balitas, @male_balitas         = PersonFilter.new(category: 'balita', desa: @desa).run
      @female_caberawits, @male_caberawits   = PersonFilter.new(category: 'caberawit', desa: @desa).run
      @female_pra_remajas, @male_pra_remajas = PersonFilter.new(category: 'pra_remaja', desa: @desa).run
      @female_remajas, @male_remajas         = PersonFilter.new(category: 'remaja', desa: @desa).run
      @female_muda_mudis, @male_muda_mudis   = PersonFilter.new(category: 'muda_mudi', desa: @desa).run
      @female_pembinas, @male_pembinas       = PersonFilter.new(category: 'pembina', desa: @desa).run
      @female_lansias, @male_lansias         = PersonFilter.new(category: 'lansia', desa: @desa).run

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
