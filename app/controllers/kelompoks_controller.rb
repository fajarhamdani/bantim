class KelompoksController < BaseController
  add_breadcrumb "Beranda", :root_url
  
  before_action :set_kelompok, only: [:show, :edit, :update, :destroy]
  
  # GET /kelompoks/1
  def show
    add_breadcrumb @desa.name.capitalize, desa_url(@desa)

    @people = @kelompok.people
  end

  # GET /kelompoks/new
  def new
    set_desa
    
    @kelompok = Kelompok.new
  end

  # GET /kelompoks/1/edit
  def edit
  end

  # POST /kelompoks
  def create
    set_desa

    @kelompok = Kelompok.new(kelompok_params)

    respond_to do |format|
      if @kelompok.save
        format.html {
          redirect_to desa_url(@desa), notice: "Kelompok #{@kelompok.name.capitalize} Berhasil Dibuat." 
        }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /kelompoks/1
  def update
    respond_to do |format|
      if @kelompok.update(kelompok_params)
        format.html {
          redirect_to redirect_to desa_url(@desa), notice: "Kelompok #{@kelompok.name.capitalize} Berhasil Diubah."
        }
      else
        format.html { render :edit }
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
    def set_desa
      @desa = Desa.friendly.find(params[:desa_id])

      if @desa.blank?
        flash[:notice] = 'Desa tidak ditemukan.'
        redirect_to root_url
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_kelompok
      @kelompok = Kelompok.friendly.find(params[:id])

      if @kelompok.blank?
        flash[:notice] = 'Kelompok tidak ditemukan.'
        redirect_to kelompoks_url
      end

      @desa = @kelompok.desa
    end

    # Only allow a list of trusted parameters through.
    def kelompok_params
      desa = Desa.friendly.find(params[:desa_id])

      params.require(:kelompok).permit(:name, :address).merge(desa_id: desa.id)
    end
end
