class MembershipRecord < ApplicationRecord
  include Timer

  belongs_to :user
  has_many :membership_record_details
  has_many :membership_score_policies, through: :membership_record_details

  before_create :set_default_time
  # before_create :set_record_time

  def year_and_month
    record_time.in_time_zone('Beijing').strftime("%Y年%m月")
  end
end