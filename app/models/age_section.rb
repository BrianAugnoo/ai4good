class AgeSection < ApplicationRecord
  has_many :groups
  has_many :age_examiners
  has_many :examiners, through: :age_examiners
  @ages = { "small"=> 15, "medium"=> 20, "big"=> 25 }

  def self.create_for_seed
    @ages.each { |size, age| self.create!(value: age, size: size) }
  end

  def self.set_ages(**ages)
    self.check_ages(ages) ? @ages = ages : return "wrong argument"
    @ages.each do |size, value|
      self.all.count == 3 ? self.where(size: size)[0].update(value: value) : self.create_for_seed
    end
  end

  private
  def self.check_ages(ages)
    ages.each do |key, value|
      return false if !value.is_a?(Integer) || ![ "small", "medium", "big" ].include?(key.to_s)
    end
    ages.size == 3
  end
end
