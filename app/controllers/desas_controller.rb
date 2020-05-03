class DesasController < BaseController
  before_action :set_desa, only: [:show, :edit, :update, :destroy]

  # GET /desas
  def index
    @desas = Desa.all
  end

  # GET /desas/1
  def show
  end

  # GET /desas/new
  def new
    @desa = Desa.new
  end

  # GET /desas/1/edit
  def edit
  end

  # POST /desas
  def create
    @desa = Desa.new(desa_params)

    respond_to do |format|
      if @desa.save
        format.html { redirect_to desas_url, notice: 'Desa was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /desas/1
  def update
    respond_to do |format|
      if @desa.update(desa_params)
        format.html { redirect_to @desa, notice: 'Desa was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /desas/1
  def destroy
    @desa.destroy
    respond_to do |format|
      format.html { redirect_to desas_url, notice: 'Desa was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_desa
      @desa = Desa.friendly.find(params[:id])

      if @desa.blank?
        flash[:notice] = 'Desa tidak ditemukan'
        redirect_to desas_url
      end
    end

    # Only allow a list of trusted parameters through.
    def desa_params
      params.require(:desa).permit(:name)
    end
end
