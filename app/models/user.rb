class User < ApplicationRecord
  include Timer

  has_many :membership_records

  before_create :set_default_time

end