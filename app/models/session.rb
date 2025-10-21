class Session < ApplicationRecord
  belongs_to :admin
  belongs_to :group
  has_many :evals
end
