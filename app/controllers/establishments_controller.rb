class EstablishmentsController < ApplicationController
  def index
    @establishments = Establishment.all
  end

  def show
    @establishment = Establishment.find(params[:id])
    @permited_examiners = Examiner.where(permited: true)
  end

  def new
  end
end
