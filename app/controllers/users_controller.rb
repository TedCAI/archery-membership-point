class UsersController < BaseController
  before_action :set_user, only: [:show, :new_record, :create_new_record, :update]
  before_action :authenticate_user!

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

  def update
    @user.update(update_params)
    redirect_to user_path(@user.id)
  end

  def new_record
    redirect_to user_path(@user.id) if @user.id != current_user.id
  end

  def create_new_record
    year, month, day = params[:year], params[:month], params[:day]
    daily_10m, daily_18m, basic_score = params[:daily_10m], params[:daily_18m], params[:basic_score]
    monthly_10m, monthly_18m = params[:monthly_10m], params[:monthly_18m]
    time = Time.new(year, month, day)
    records = @user.membership_records.where(record_time: time)
    if @user.id == current_user.id && records.blank?
      membership_record = @user.membership_records.create
      membership_record.update(record_time: time)
      [daily_10m, daily_18m, monthly_10m, monthly_18m, basic_score].each do |policy_id|
        membership_record.membership_record_details.create(membership_score_policy_id: policy_id) unless policy_id == "0"
      end
    end

    redirect_to user_path(@user.id)
  end

  def logout
    sign_out_and_redirect(current_user)
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
  end

  def update_params
    params.permit :name, :initial_score
  end
end