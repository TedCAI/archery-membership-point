class SetScore < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :date, presence: true
  validates :total_score, numericality: { greater_than: -1 }

  has_many :set_score_details
end