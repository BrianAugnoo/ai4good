class GroupsController < ApplicationController
  def index
    ratted = params["ratted"]
    @group_type = { all: [ "", nil ], ratted: [ "", true ], remaining: [ "", false] }
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

    respond_to do |f|
      f.html
      f.turbo_stream do
        render turbo_stream: turbo_stream.replace("all_group", partial: "groups/groups", locals: { groups: @groups })
      end
    end
  end
end
