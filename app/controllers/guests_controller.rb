class GuestsController < ApplicationController
  def index
  end

  def edit
    @group = Group.where(indentifiant: params[:indentifiant]).first
    if @group.nil?
      flash[:alert] = "identifiant introuvable!"
      redirect_to guests_path
    end
  end
end
