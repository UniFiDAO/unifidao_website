class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]

  def users
    redirect_back fallback_location: root_path unless current_user_admin?

    @users = params[:type].nil? ? User.team : User.where(user_type: params[:type])

    respond_to do |format|
      format.html
      format.csv { send_data @users.to_csv, filename: "users-#{params[:type]}#{Date.today}.csv" }
    end
  end

  def events
    redirect_back fallback_location: root_path unless current_user_admin?

    @events = Event.all
  end

  def teams
    redirect_back fallback_location: root_path unless current_user_admin?

    @teams = Team.all
  end

  def download_investors
    redirect_back fallback_location: root_path unless current_user_admin?

    @investor
  end
end
