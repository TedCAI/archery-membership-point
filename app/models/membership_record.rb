class MembershipRecord < ApplicationRecord
  belongs_to :user

  has_many :membership_record_details
end