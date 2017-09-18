class Me::BaseController < ApplicationController
  layout 'me'
  before_action :check_login
  def check_login
    redirect_to root_path unless user_signed_in?
  end
end