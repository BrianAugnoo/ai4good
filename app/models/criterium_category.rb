class CriteriumCategory < ApplicationRecord
  has_many :criteria, dependent: :destroy
  has_many :groups, through: :criteria
  has_many :examiners, through: :criteria
  def self.categories
    {
      "Evaluation 2"=> {
        "clareté du message"=> "La vidéo raconte-t-elle clairement une idée ou une histoire ?",
        "qualité audio-visuelle"=> "Le rendu est-il agréable à regarder et à écouter ?",
        "originalité"=> "L'usage de l'IA est-il créatif et personnel ?",
        "maitrise de l'outil"=> "Les élèves ont-ils bien utilisé les prompts ou les réglages IA ?",
        "cohérence final"=> "Le résultat correspond-il à l'intention de départ?"
      }
    }
  end

  def self.keys
    self.categories.map do |key, value|
      key
    end
  end

  def self.create_for_seed
    self.keys.each do |name|
      self.create!(name: name)
    end
  end

  def submited?(examiner = false, group)
    if examiner
      submited_criteria = self.criteria.where(examiner: examiner, group: group)
      submited_criteria.any? ? return [ true, submited_criteria ] : return [ false, [] ]
    else
      self.criteria.where(group: group).map(&:examiner).uniq
    end
  end
end
