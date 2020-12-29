class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :should_join, :join_team]

  # GET /users
  # GET /users.json
  def index
    @teams = Team.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  def should_join

  end

  def join_team
    current_user.join_team
    redirect_to events_path, notice: 'User was successfully updated.'
  end

  def new_team
    redirect_to edit_user_path(current_user), notice: 'Please select a new team name.'
  end

  private
  def set_team
    @team = Team.friendly.find(params[:id])
  end
end
