class DashboardController < ApplicationController
  def admin
  end

  def examiner
    @groups = Group.all
    @ratted_groups = @groups.where(ratted: true)
    @remaining_groups = @groups.where(ratted: false)
  end
end
