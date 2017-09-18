# frozen_string_literal: true

class Auth::SessionsController < Devise::SessionsController
  include Devise::Controllers::Rememberable

  #layout 'auth'

  skip_before_action :require_no_authentication, only: [:create]
  #skip_before_action :check_suspension, only: [:destroy]
  #prepend_before_action :authenticate_with_two_factor, if: :two_factor_enabled?, only: [:create]

  def create
    Rails.logger.info "---------- konpyu ----------"
    super do |resource|
      Rails.logger.info "---------- konpyu ----------"
      resource.username = SecureRandom.hex(10)
    end
  end

  protected

  #def find_user
  #  if session[:otp_user_id]
  #    User.find(session[:otp_user_id])
  #  elsif user_params[:email]
  #    User.find_for_authentication(email: user_params[:email])
  #  end
  #end

  def user_params
    params.require(:user).permit(:email, :password, :otp_attempt)
  end
end
