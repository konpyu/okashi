class Me::AccountsController < Me::BaseController
  def show
    @user = current_user
  end
  def update
  end
end