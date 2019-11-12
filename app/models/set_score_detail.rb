class SetScoreDetail < ApplicationRecord
  belongs_to :set_score

  validates :set_score_id, presence: true
  validates :score, numericality: { greater_than: -1 }
end