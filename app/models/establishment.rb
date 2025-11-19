class Establishment < ApplicationRecord
  has_many :groups
  has_many :establishment_criteria
  has_many :examiners, through: :establishment_criteria

  has_one_attached :logo
  has_many_attached :videos

  def valid_eval?
    self.examiners.uniq.count == Examiner.where(permited: true).count
  end

  def total_marks
    criteria = self.establishment_criteria
    if criteria.to_a.any?
      (criteria.sum(:values) / criteria.count).round(2)
    else
      0
    end
  end
end
