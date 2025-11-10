class Group < ApplicationRecord
  has_many :criteria
  has_many :members
  has_one :session
  belongs_to :age_section
  has_many :criterium_categories, through: :criteria
  has_many :examiners, through: :criteria
  has_one_attached :video
  has_one_attached :photo
  # retourne la note final si tout les examinateur ont noter corectement tout les
  # critére sinon il y a un bug et ca retourne une string
  def final_marks
    criteria = self.criteria
    criteria.sum(:values) / criteria.count
  end

  def validate_rate
    valid = false
    CriteriumCategory.keys.each do |category|
      total_examiners = self.age_section.examiners.reload.pluck(:id).sort
      submited_examiner = CriteriumCategory.where(name: category).first.submited?(self).map { |examiner| examiner.id }.sort
      valid = submited_examiner == total_examiners
    end
    self.update(ratted: valid)
    self.update(points: final_marks)
    self.save ? return valid : return 0
  end

  def add_members(members)
    members.each do |member_name|
      Member.create!(name: member_name, group: self)
    end
  end

  def rated_by?(examiner, category)
    begin
      if self.criterium_categories.where(name: category)[0].criteria.exists?(column: "entry")
        true
      else
        false
      end
    rescue
      false
    end
  end

  def evaluation
    CriteriumCategory.keys.map do |category|
      mark = 0
      total_examiners = self.age_section.examiners.reload.pluck(:id).sort
      submited_examiner = CriteriumCategory.where(name: category).first.submited?(self).map { |examiner| examiner.id }.sort
      valid = submited_examiner == total_examiners
      valid ? mark = CriteriumCategory.where(name: category)[0].criteria.where(group: self).sum(:values) : next { mark: "En cours", class: "" }
      classify_mark(mark / 5)
    end
  end

  def classify_mark(mark)
    if mark < 1.25
      { mark: mark, class: "mark-1" }
    elsif mark < 2.5
      { mark: mark, class: "mark-2" }
    elsif mark < 3.75
      { mark: mark, class: "mark-3" }
    elsif
      { mark: mark, class: "mark-4" }
    end
  end
end
