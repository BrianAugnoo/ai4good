class CriteriaNamesController < ApplicationController
  def index
    @criteria_names = CriteriaName.all
  end

  def create
    begin
      CriteriaName.create(params.require(:criteria_name).permit(:name, :description))
      flash[:notice] = "Critére ajouter avec succès !"
      redirect_to criteria_names_path
    rescue => e
      raise e
    end
  end
end
