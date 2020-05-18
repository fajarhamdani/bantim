class DashboardController < BaseController
  def index
    @desas = Desa.order(:name)
    @desa  = Desa.new
  end
end
