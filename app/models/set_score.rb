class SetScore < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :date, presence: true
  validates :total_score, numericality: { greater_than: -1 }

  has_many :set_score_details

  def first_half_set
    self.set_score_details[0]
  end

  def last_half_set
    self.set_score_details[1]
  end

  def cal_total_score
    first_half_set_score = first_half_set&.score || 0
    last_half_set_score = last_half_set&.score || 0
    first_half_set_score + last_half_set_score
  end

  def update_total_score
    self.update(total_score: cal_total_score)
  end
end