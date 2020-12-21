class ApplicationController < ActionController::Base
  # before_action :redirect_to_https

  def current_user_admin?
    !!current_user&.admin?
  end

  def requires_admin
    redirect_to action: :index unless current_user_admin?
  end

  # def redirect_to_https
  #   redirect_to :protocol => "https://" unless (request.ssl? || request.local?)
  # end
end
