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
end
