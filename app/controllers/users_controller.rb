class UsersController < BaseController
  before_action :set_user, only: [:show]

  def index
    @users = User.all
  end
  
  def show
    @membership_records = @user&.membership_records || []
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
  end
end