class Criterium < ApplicationRecord
  belongs_to :examiner
  belongs_to :group

  # verifie que l'examinateur ne soumet pas plusieur fois une note sur le même critére
  validates :id, uniqueness: { scope: :examiner, message: "the examiner has already submit this criterium" }
  # verifie que le critére fait bien parti de ce que l'on attend
  validate :criteria_identifiable
  validate :valid_value

  def criteria_identifiable
    unless Criterium.criteria_list.include?(self.name)
      errors.add("unidentified criterium")
    end
  end

  def valid_value
    if self.values < 0 || self.values > 20
      errors.add("invalid value")
    end
  end

  def self.criteria_list
    [ "originality", "creativity", "Consistency", "Technical quality", "Impact" ]
  end
end
