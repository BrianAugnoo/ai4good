class Establishment < ApplicationRecord
  has_many :groups
  has_many :establishment_criteria

  has_one_attached :logo
end
