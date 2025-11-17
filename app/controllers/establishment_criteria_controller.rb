class EstablishmentCriteriaController < ApplicationController
  def new
    @establishment = Establishment.find(params[:establishment_id])
    @establishment_criterium = EstablishmentCriterium.new
    @criterium_category = CriteriumCategory.where(name: CriteriumCategory.keys[0]).first
  end

  def create
    begin
      establishment = Establishment.find(params[:establishment_id].to_i)
      @criterium_category = CriteriumCategory.where(name: CriteriumCategory.keys[0]).first
      CriteriumCategory.categories[@criterium_category.name].each do |key, value|
        EstablishmentCriterium.create!(
          examiner_id: current_examiner.id,
          name: key,
          establishment_id: params[:establishment_id].to_i,
          values: params[key.to_sym]
        )
      end
    rescue => e
      raise e
    end
      redirect_to establishment_path(establishment)
  end

  def edit
  end
end
