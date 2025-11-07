class Criterium < ApplicationRecord
  belongs_to :examiner
  belongs_to :group
  belongs_to :criterium_category

  # verifie que l'examinateur ne soumet pas plusieur fois une note sur le même critére
  validates :id, uniqueness: { scope: :examiner, message: "the examiner has already submit this criterium" }
  # verifie que le critére fait bien parti de ce que l'on attend
  validate :valid_value

  def valid_value
    if self.values < 0 || self.values > 10
      errors.add("invalid value")
    end
  end
end
