class EmailLinksController < ApplicationController
  before_action :set_email_link, only: [:show, :edit, :update, :destroy]

  # GET /email_links
  # GET /email_links.json
  def index
    @email_links = EmailLink.all
  end

  # GET /email_links/1
  # GET /email_links/1.json
  def show
  end

  # GET /email_links/new
  def new
    @email_link = EmailLink.new
  end

  # GET /email_links/1/edit
  def edit
  end

  # POST /email_links
  # POST /email_links.json
  def create
    @email_link = EmailLink.new(email_link_params)

    respond_to do |format|
      if @email_link.save
        format.html { redirect_to @email_link, notice: 'Email link was successfully created.' }
        format.json { render :show, status: :created, location: @email_link }
      else
        format.html { render :new }
        format.json { render json: @email_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /email_links/1
  # PATCH/PUT /email_links/1.json
  def update
    respond_to do |format|
      if @email_link.update(email_link_params)
        format.html { redirect_to @email_link, notice: 'Email link was successfully updated.' }
        format.json { render :show, status: :ok, location: @email_link }
      else
        format.html { render :edit }
        format.json { render json: @email_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /email_links/1
  # DELETE /email_links/1.json
  def destroy
    @email_link.destroy
    respond_to do |format|
      format.html { redirect_to email_links_url, notice: 'Email link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email_link
      @email_link = EmailLink.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def email_link_params
      params.require(:email_link).permit(:token, :expires_at, :user_id)
    end
end
