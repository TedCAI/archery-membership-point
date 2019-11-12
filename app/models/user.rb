class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include Timer

  has_many :membership_records
  has_many :set_scores

  before_create :set_default_time

  def total_score
    initial_score + membership_records.map(&:membership_score_policies).flatten.map(&:score).sum
  end

end