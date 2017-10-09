class User < ApplicationRecord
  include Timer

  has_many :membership_records

  before_create :set_default_time

  def total_score
    membership_records.map(&:membership_score_policies).flatten.map(&:score).sum
  end

end