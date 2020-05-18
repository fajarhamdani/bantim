class DashboardController < BaseController
  def index
    @desas = Desa.includes(:people).order(:name)
    @desa  = Desa.new
  end
end
