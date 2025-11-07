class GroupsController < ApplicationController
  def index
    @age_section = AgeSection.find(params[:age_section_id])
    groups = @age_section.groups
    ratted = params["ratted"]
    @group_type = { all: [ "", nil ], ratted: [ "", true ], remaining: [ "", false ] }
    if ratted == "true"
      @groups = groups.where(ratted: ratted)
      @group_type[:ratted] = [ "selected", true ]
    elsif ratted == "false"
      @groups = groups.where(ratted: ratted)
      @group_type[:remaining] = [ "selected", false ]
    else
      @groups = groups.all
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
    @age_section = AgeSection.find(params[:age_section_id])
  end

  def create
    @age_section = AgeSection.find(params[:age_section_id])
    group = Group.new(set_params)
    group.age_section = @age_section
    group.add_members(params[:members].split(",")) unless params[:members].empty?
    if group.save
      redirect_to groups_path(age_section_id: @age_section.id)
    else
      raise
    end
  end

  def update
    group = Group.find(params[:id])
    group.update(set_params)
    raise unless group.save
  end

  private
  def set_params
    params.require(:group).permit(:etablished, :name, :theme, :timer)
  end
end
