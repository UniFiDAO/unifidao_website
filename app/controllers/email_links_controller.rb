class EmailLinksController < ApplicationController
  before_action :set_email_link, only: [:show]

  def new

  end

  def create
    @email_link = EmailLink.generate(params[:email])

    if @email_link
      flash[:notice] = "Email sent! Please, check your inbox."
      redirect_to root_path
    else
      flash[:alert] = "Email doesn't exist."
      redirect_to new_email_link_path
    end
  end

  def show
    unless @email_link
      flash[:alert] = "Invalid or expired token!"
      return redirect_to new_email_link_path
    end

    sign_in(@email_link.user, scope: :user)
    redirect_path = @email_link.path || events_path

    @email_link.destroy

    redirect_to redirect_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email_link
      @email_link = EmailLink.find_by(id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def email_link_params
      params.require(:email_link).permit(:token, :expires_at, :user_id)
    end
end

