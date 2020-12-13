class ApplicationController < ActionController::Base

  def current_user_admin?
    !!current_user&.admin?
  end

  def requires_admin
    redirect_to action: :index unless current_user_admin?
  end
end
