class UsersController < BaseController
  before_action :set_user, only: [:show, :new_record, :create_new_record, :update, :edit_record, :update_record, :temp_show]
  before_action :authenticate_user!

  def index
    @users = User.all
  end
  
  def show
    @membership_records = @user&.membership_records || []
    if @membership_records.present?
      @score_list = {}
      @score_list_array = ""
      @score_list_array += "date\tscore\n"
      initial_score = @user.initial_score
      previous_record_time = nil
      @membership_records.order(record_time: :asc).each do |record|
        initial_score += record.membership_score_policies.map(&:score).sum
        @score_list[record.id] = initial_score
        current_record_time = record.record_time.in_time_zone('Beijing').strftime("%Y-%m-%d")
        # @score_list_array << [record.record_time&.in_time_zone('Beijing')&.strftime("%Y%m%d"), initial_score]
        while(true) do
          if !previous_record_time || current_record_time == previous_record_time.tomorrow.in_time_zone('Beijing').strftime("%Y-%m-%d")
            @score_list_array += "#{current_record_time}\t#{initial_score}\n"
            previous_record_time = record.record_time
            break
          else
            previous_record_time = previous_record_time.tomorrow
            @score_list_array += "#{previous_record_time.in_time_zone('Beijing').strftime("%Y-%m-%d")}\t#{initial_score}\n"
          end
        end
      end
    end
    puts "!!!!!!!! #{@score_list_array}"
    respond_to do |format|
      format.html
      # format.json { render json: {score_list: @score_list_array} }
      format.json { render json: {score_list: @score_list_array} }
    end
  end

  def temp_show

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

  def edit_record
    @record = @user.membership_records.find_by(id: params[:record_id])

    if @record
      render 'edit_record'
    else
      redirect_to user_path(@user.id)
    end
  end

  def update_record
    @record = @user.membership_records.find_by(id: params[:record_id])
    daily_10m, daily_18m, basic_score = params[:daily_10m], params[:daily_18m], params[:basic_score]
    monthly_10m, monthly_18m = params[:monthly_10m], params[:monthly_18m]
    if @user.id == current_user.id && @record
      @record.membership_record_details.delete_all
      [daily_10m, daily_18m, monthly_10m, monthly_18m, basic_score].each do |policy_id|
        @record.membership_record_details.create(membership_score_policy_id: policy_id) unless policy_id == "0"
      end
    end
    redirect_to edit_record_user_path(id: @user.id, record_id: @record.id)
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