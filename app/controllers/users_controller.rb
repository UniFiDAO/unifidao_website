class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = Team.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    #redirect_to root_path unless @user
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to events_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    unless @user
      flash[:alert] = "We can not find account"
      return redirect_back fallback_location: root_path
    end

    respond_to do |format|
      if @user&.update(user_params)

        unless @user.team
          @team = Team.find_by(name: @user.name)

          if @team
            return redirect_to should_join_team_path(@team)
          else
            @user.create_team
          end
        end

        return redirect_to users_admins_path if current_user_admin?
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
    #@user.email_links.destroy_all
    @user&.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.friendly.find_by(id: params[:id]) || User.find_by(slug: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:user_type,
                                   :name,
                                   :fund,
                                   :website,
                                   :partner,
                                   :linkedin,
                                   :twitter,
                                   :telegram,
                                   :logo,
                                   :discord,
                                   :github,
                                   :uniswap_pool,
                                   :description)
    end
end
