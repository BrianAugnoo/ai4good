class EstablishmentsController < ApplicationController
  def index
    @establishments = Establishment.all.sort_by(&:total_marks).reverse
  end

  def show
    @establishment = Establishment.find(params[:id])
    @permited_examiners = Examiner.where(permited: true)
    if examiner_signed_in?
      @evals = current_examiner.establishment_criteria.where(establishment: @establishment)
    end
  end

  def new
  end

  def create
    establishment = Establishment.new(set_params)
    if establishment.save
      flash[:notice] = "Etablissement ajouter avec succés!"
      redirect_to establishments_path
    else
      flash[:alert] = "Une érreur est survenue"
    end
  end

  def edit
    @edit_video = params[:video]
    @establishment = Establishment.find(params[:id])
  end

  def update
    establishment = Establishment.find(params[:id])
    establishment.update(set_params)
    if establishment.save
      flash[:notice] = "Videos ajoutés avec succés"
      redirect_to establishment_path(establishment)
    else
      raise
      flash[:alert] = "Une érreur ses produites"
      render :edit
    end
  end

  private
  def set_params
    params.require(:establishment).permit(:name, :logo, videos: [])
  end
end
