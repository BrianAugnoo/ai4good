class EstablishmentCriteriaController < ApplicationController
  def new
    @establishment = Establishment.find(params[:establishment_id])
    @establishment_criterium = EstablishmentCriterium.new
    @criteria_names = CriteriaName.all
  end

  def create
    begin
      establishment = Establishment.find(params[:establishment_id].to_i)
      @criteria_names = CriteriaName.all
      @criteria_names.each do |criteria_name|
        EstablishmentCriterium.create!(
          examiner_id: current_examiner.id,
          name: criteria_name.name,
          establishment_id: params[:establishment_id].to_i,
          values: params[:establishment_criterium][criteria_name.name.to_sym]
        )
      end
    rescue => e
      current_examiner.establishment_criteria.where(establishment: establishment).destroy_all
      raise e
    end
      flash[:notice] = "Evaluation soumis avec succés"
      redirect_to establishment_path(establishment)
  end

  def edit
    @establishment = EstablishmentCriterium.find(params[:id]).establishment
    @establishment_criterium = EstablishmentCriterium.new
    @criteria_names = CriteriaName.all
  end

  def update
    begin
      establishment = Establishment.find(params[:id].to_i)
      current_examiner.establishment_criteria.where(establishment: establishment).each do |criterium|
        criterium.update(values: params[criterium.name])
        raise and return until criterium.save
      end
      flash[:notice] = "Evaluation Modifier avec succés"
      redirect_to establishment_path(establishment)
    rescue => e
      flash[:alert] = "Une erreur s'est produite, err: #{e}"
    end
  end
end
