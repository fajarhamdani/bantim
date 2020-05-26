class KelompoksController < BaseController
  before_action :set_kelompok, only: [:show, :edit, :update, :destroy]
  
  # GET /kelompoks/1
  def show
    add_kelompok_breadcrumbs

    @people = @kelompok.people
  end

  # GET /kelompoks/1/edit
  def edit
    respond_to do |format|
      format.js
    end
  end

  def new
    @desa     = Desa.friendly.find_by_slug(params[:desa_id])
    @kelompok = Kelompok.new
  end

  # POST /kelompoks
  def create
    @desa = Desa.friendly.find_by_slug(params[:desa_id])
    @kelompok = Kelompok.new(kelompok_params)

    respond_to do |format|
      if @kelompok.save

        format.html {
          redirect_to desa_url(@desa), notice: "Kelompok #{@kelompok.name.capitalize} Berhasil Dibuat." 
        }
      else
        format.js
      end
    end
  end

  # PATCH/PUT /kelompoks/1
  def update
    respond_to do |format|
      if @kelompok.update(kelompok_params)
        format.html {
          redirect_to desa_url(@desa), notice: "Kelompok #{@kelompok.name.capitalize} Berhasil Diubah."
        }
      else
        format.js
      end
    end
  end

  # DELETE /kelompoks/1
  def destroy
    destroyed_name = @kelompok.name.capitalize

    @kelompok.destroy
    respond_to do |format|
      format.html { redirect_to desa_url(@desa), notice: "Kelompok #{destroyed_name} Berhasil Dihapus." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kelompok
      @kelompok = Kelompok.friendly.find_by_slug(params[:id])

      if @kelompok.blank?
        flash[:notice] = 'Kelompok tidak ditemukan.'
        redirect_to root_url
      end

      @desa = @kelompok&.desa
    end

    # Only allow a list of trusted parameters through.
    def kelompok_params
      params_kelompok = params.require(:kelompok).permit(:name, :address)
      desa = Desa.friendly.find_by_slug(params[:desa_id])
      params_kelompok = params_kelompok.merge(desa_id: desa.id) if desa.present?

      params_kelompok
    end

    def add_kelompok_breadcrumbs
      add_breadcrumb @desa.name.capitalize, desa_url(@desa)
      add_breadcrumb @kelompok.name.capitalize
    end
end
