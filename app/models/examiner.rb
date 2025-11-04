class Examiner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :criteria
  has_many :evals
  has_many :sessions, through: :evals
  has_many :age_examiners
  has_many :age_sections, through: :age_examiners
  has_many :criterium_categories, through: :criteria

  def radom_marks(group)
    Criterium.criteria_list.each do |criterium_name|
      Criterium.create!(name: criterium_name, examiner: self, group: group, values: rand(20))
    end
  end

  def self.total
    self.all.count
  end

  def submit_eval?
    self.evals.first.done
  end

  def criteria_submited(group, category)
    begin
      self.criterium_categories.where(name: category)[0].criteria.where(group_id: group.id)
    rescue
      []
    end
  end
end
