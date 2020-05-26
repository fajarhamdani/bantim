class DesasController < BaseController
  before_action :set_desa, only: [:show, :edit, :update, :destroy]

  # GET /desas/1
  def show
    load_dashboard_variables
    
    @kelompoks = @desa.kelompoks.includes(:people).order(:name)
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
        format.html { redirect_to root_url, notice: "Desa #{@desa.name} Berhasil Ditambahkan." }
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

    def load_dashboard_variables
      @kelompoks = @desa.kelompoks.includes(:people).order(:name)

      gon.push({
        :desa_id => @desa.slug,
        :kelompok_names => @kelompoks.map{ |kelompok| kelompok.name },
        :person_each_kelompok => @kelompoks.map{ |kelompok| kelompok.people.size },
        :total_person => @desa.people.count
      })
    end
end
