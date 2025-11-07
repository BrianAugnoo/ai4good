class AgeSectionsController < ApplicationController
  def index
    @age_sections = AgeSection.all
  end

  def show
  end
end
