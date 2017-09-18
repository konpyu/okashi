class SessionsController < ApplicationController
  layout "auth"
  def signin
    redirect_to root_path if user_signed_in?
  end
end
