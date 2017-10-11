class UsersController < BaseController
  before_action :set_user, only: [:show]

  def index
    @users = User.all
  end
  
  def show
    @membership_records = @user&.membership_records || []
    if @membership_records.present?
      @score_list = {}
      initial_score = @user.initial_score
      @membership_records.order(record_time: :asc).each do |record|
        initial_score += record.membership_score_policies.map(&:score).sum
        @score_list[record.id] = initial_score
      end
    end
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
  end
end