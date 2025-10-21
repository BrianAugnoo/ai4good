class Examiner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :criteria
  has_one :eval

  def radom_marks(group)
    Criterium.criteria_list.each do |criterium_name|
      Criterium.create!(name: criterium_name, examiner: self, group: group, values: rand(20))
    end
  end
end
