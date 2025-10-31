class AgeExaminer < ApplicationRecord
  belongs_to :examiner
  belongs_to :age_section
end
