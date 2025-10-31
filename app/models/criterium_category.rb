class CriteriumCategory < ApplicationRecord
  has_many :criteria
  def self.categories
    {
      "30%"=> {
        "organisation"=> "Le groupe s'est-il bien réparti les rôles et les tâches ?",
        "méthode de travail"=> "Le projet a-t-il été préparé avec une vraie démarche (idées, scénario, essais) ?",
        "esprit critique"=> "Les élèves ont-ils su améliorer leur travail après les premiers essais ?",
        "créativité" => "Ont-ils proposé des idées originales ?",
        "colaboration"=> "Ont-ils bien travaillé ensemble et communiqué efficacement ?"
      },

      "70%"=> {
        "clareté du message"=> "La vidéo raconte-t-elle clairement une idée ou une histoire ?",
        "qualité audio-visuelle"=> "Le rendu est-il agréable à regarder et à écouter ?",
        "originalité"=> "L'usage de l'IA est-il créatif et personnel ?",
        "maitrise de l'outil"=> "Les élèves ont-ils bien utilisé les prompts ou les réglages IA ?",
        "cohérence final"=> "Le résultat correspond-il à l'intention de départ?"
      }
    }
  end

  def self.create_for_seed
    self.create!(name: "30%")
    self.create!(name: "70%")
  end

  def self.first_categories
    self.categories["30%"]
  end
end
