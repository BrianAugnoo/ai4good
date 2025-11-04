class DashboardController < ApplicationController
  before_action :authenticate_examiner!, only: [ :examiner ]
  before_action :authenticate_admin!, only: [ :admin ]
  def admin
    @groups = Group.all
    @ratted_groups = @groups.where(ratted: true)
    @remaining_groups = @groups.where(ratted: false)
    @age_sections = AgeSection.all
  end

  def examiner
    @groups = Group.all
    @ratted_groups = @groups.where(ratted: true)
    @remaining_groups = @groups.where(ratted: false)
    @age_sections = current_examiner.age_sections
  end
end
