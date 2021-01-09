class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]

  def users
    @users = params[:type].nil? ? User.team : User.where(user_type: params[:type])

    respond_to do |format|
      format.html
      format.csv { send_data @users.to_csv, filename: "users-#{params[:type]}#{Date.today}.csv" }
    end
  end

  def events
    @events = Event.all
  end

  def teams
    @teams = Team.all
  end

  def download_investors
    @investor
  end
end
