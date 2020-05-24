class DashboardController < BaseController
  def index
    @desa  = Desa.new
  end
end
