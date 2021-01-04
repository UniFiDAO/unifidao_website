class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :should_join, :join_team, :update, :destroy, :edit]

  # GET /users
  # GET /users.json
  def index
    @teams = Team.order(:name)
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  def should_join

  end

  def edit
    redirect_back fallback_location: root_path unless current_user_admin? || current_user.team == @team
  end

  def join_team
    current_user.join_team
    redirect_to events_path, notice: 'User was successfully updated.'
  end

  def new_team
    redirect_to edit_user_path(current_user), notice: 'Please select a new team name.'
  end

  def update
    redirect_back fallback_location: root_path unless current_user_admin? || current_user.team == @team

    respond_to do |format|
      if @team.update(team_params)
        return redirect_to teams_admins_path if current_user_admin?
        format.html { redirect_to events_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    redirect_back fallback_location: root_path unless current_user_admin?
    @team.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_team
    @team = Team.friendly.find(params[:id])
  end

  def team_params
    params.require(:team).permit! #.permit( :name,  :website, :twitter, :telegram, :logo, logo_attachment_attributes: [:id, :_destroy])
  end
end
