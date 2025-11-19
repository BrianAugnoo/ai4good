class CriteriaNamesController < ApplicationController
  def index
    @criteria_names = CriteriaName.all
  end

  def create
    begin
      CriteriaName.create(params.require(:criteria_name).permit(:name, :description))
      EstablishmentCriterium.destroy_all
      flash[:notice] = "Critére ajouter avec succès !"
      redirect_to criteria_names_path
    rescue => e
      raise e
    end
  end

  def destroy
    begin
      criteria = CriteriaName.find(params[:id])
      if criteria.destroy
        EstablishmentCriterium.destroy_all
        flash[:notice] = "Critére #{criteria.name} suprimer avec succès !"
        redirect_to criteria_names_path
      else
        flash[:alert] = "Une erreur est survenu"
        render :index
      end
    rescue => e
      raise e
    end
  end
end
