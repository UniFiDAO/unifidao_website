class WelcomeController < ApplicationController
  def index
    redirect_to events_path if user_signed_in?
  end

  def new

  end

  def check

  end
end
