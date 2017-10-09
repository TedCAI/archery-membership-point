class MembershipRecordDetail < ApplicationRecord
  belongs_to :membership_record
  belongs_to :membership_score_policy
end