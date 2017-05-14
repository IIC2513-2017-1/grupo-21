module Secured
  extend ActiveSupport::Concern

  def logged_in?
    redirect_to(root_path, notice: 'Acceso prohibido') unless current_user
  end
end
