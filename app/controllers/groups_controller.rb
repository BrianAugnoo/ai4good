class GroupsController < ApplicationController
  def index
    @age_section = AgeSection.find(params[:age_section_id])
    groups = @age_section.groups
    ratted = params["ratted"]
    @group_type = { "tout les groups": [ "", nil ], "evaluation terminé": [ "", true ], "evaluation en cours": [ "", false ] }
    if ratted == "true"
      @groups = groups.where(ratted: ratted)
      @groups = groups.evaluated_by(current_examiner) if examiner_signed_in?
      @group_type[:"evaluation terminé"] = [ "selected", true ]
    elsif ratted == "false"
      @groups = groups.where(ratted: ratted)
      @groups = groups.not_evaluated_by(current_examiner) if examiner_signed_in?
      @group_type[:"evaluation en cours"] = [ "selected", false ]
    else
      @groups = groups
      @group_type[:"tout les groups"] = [ "selected", nil ]
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
    @establishments = Establishment.all
  end

  def create
    @age_section = AgeSection.find(params[:age_section_id])
    group = Group.new(set_params)
    group.age_section = @age_section
    if group.save
      flash[:notice] = "Group Ajouter Avec succés"
      redirect_to groups_path(age_section_id: @age_section.id)
    else
      raise
    end
  end

  def edit
    @edit_video = params[:video]
    @group = Group.find(params[:id])
  end

  def update
    group = Group.find(params[:id])
    group.update(set_params)
    if group.save
      flash[:notice] = "Modification Appliqué avec succès!"
      if params[:guest]
        group.members.destroy_all
        group.add_members(params[:members].split(",")) unless params[:members].empty?
        redirect_to root_path
      else
        redirect_to group_path(group)
      end
    else
      flash[:alert] = "Une erreur est survenu"
    end
  end

  private
  def set_params
    params.require(:group).permit(:name, :theme, :timer, :photo, :video, :establishment_id, :email)
  end
end
