class GroupsController < ApplicationController
  def index
    ratted = params["ratted"]
    @group_type = { all: [ "", nil ], ratted: [ "", true ], remaining: [ "", false ] }
    if ratted == "true"
      @groups = Group.where(ratted: ratted)
      @group_type[:ratted] = [ "selected", true ]
    elsif ratted == "false"
      @groups = Group.where(ratted: ratted)
      @group_type[:remaining] = [ "selected", false ]
    else
      @groups = Group.all
      @group_type[:all] = [ "selected", nil ]
    end
  end

  def show
    @group = Group.find(params[:id])
    respond_to do |f|
      f.html
    end
  end

  def new
    @group = Group.new
  end

  def create
    group = Group.new(set_params)
    group.add_members(params[:members].split(",")) unless params[:members].empty?
    if group.save
      redirect_to admin_dashboard_path
    else
      raise
    end
  end

  private
  def set_params
    params.require(:group).permit(:etablished, :name, :theme)
  end
end
