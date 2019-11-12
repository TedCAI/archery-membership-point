class SetScoreDetail < ApplicationRecord
  belongs_to :set_score

  validates :set_score_id, presence: true
  validates :score, numericality: { greater_than: -1 }
  validate :validate_set_score_on_create, on: :create
  validate :validate_set_score_on_update, on: :update

  HALF_SET_SCORE_MAX = 60
  FULL_SET_SCORE_MAX = 120

  after_commit :update_total_score

  def update_total_score
    set_score = self.set_score
    set_score.update_total_score
  end

  def validate_set_score_on_create
    validate_set_score
  end

  def validate_set_score_on_update
    validate_set_score(false)
  end

  def validate_set_score(on_create = true)
    detail = self
    if set_type == 0
      threshold = on_create ? 1 : 2
      if detail.set_score.set_score_details.count > threshold
        detail.errors.add(:score, '只能有两个半组')
      end

      if detail.score > HALF_SET_SCORE_MAX
        detail.errors.add(:score, "半组分数不能超过#{HALF_SET_SCORE_MAX}")
      end
    elsif set_type == 1
      threshold = on_create ? 0 : 1
      if detail.set_score.set_score_details.count > threshold
        detail.errors.add(:score, '已经是一个整组了')
      end

      if detail.score > FULL_SET_SCORE_MAX
        detail.errors.add(:score, "一组分数不能超过#{FULL_SET_SCORE_MAX}")
      end
    end
  end
end