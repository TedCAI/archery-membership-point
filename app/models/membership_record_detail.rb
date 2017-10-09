class MembershipRecordDetail < ApplicationRecord
  belongs_to :membership_record

  has_one :membership_score_policy
end