class Group < ApplicationRecord
  has_many :criteria
  has_many :members
  has_one :session
  belongs_to :age_section
  has_many :criterium_categories, through: :criteria
  # retourne la note final si tout les examinateur ont noter corectement tout les
  # critére sinon il y a un bug et ca retourne une string
  def final_marks
    criteria = self.criteria
    return "sybau🥀" if criteria.empty?
    total_points = criteria.sum(:values)
    num_criteria = criteria.count
    num_examiner = criteria.pluck(:examiner_id).uniq.count
    criteria_list = Criterium.criteria_list.count
    cond1 = num_criteria != 0
    cond2 = num_criteria % criteria_list == 0 && num_criteria % num_examiner == 0
    cond1 && cond2 ? (total_points/num_criteria).round(2) : "Examiners should not sumbit without all criteria marks having been met. Check the V or C."
  end

  def validate
    nb_examiner = Examiner.all.count
    eval_examiner = self.criteria.pluck(:examiner_id).uniq.count
    if nb_examiner == eval_examiner && self.final_marks.is_a?(Float)
      self.ratted = true
      self.save
      true
    else
      false
    end
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
end
