class Group < ApplicationRecord
  has_many :criteria
  has_many :members

  # retourne la note final si tout les examinateur ont noter corectement tout les
  # critére sinon il y a un bug et ca retourne une string
  def final_marks
    criteria = self.criteria
    total_points = criteria.sum(:values)
    num_criteria = criteria.count
    num_examiner = criteria.pluck(:examiner_id).uniq.count
    criteria_list = Criterium.criteria_list.count
    cond1 = num_criteria != 0
    cond2 = num_criteria % criteria_list == 0 && num_criteria % num_examiner == 0
    cond1 & cond2 ? total_points/criteria_list : "Examiners should not sumbit without all criteria marks having been met. Check the V or C."
  end
end
