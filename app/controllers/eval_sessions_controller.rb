class EvalSessionsController < ApplicationController
  def new
    @groups = Group.where(ratted: false)
    @session = Session.new
  end

  def create
    group_id = params[:group_id]
    if group_id.blank?
      redirect_to root_path and return
    end

    session = Session.new(group_id: group_id)
    session.admin = current_admin
    if session.save
      redirect_to eval_session_path(session)
    else
      raise
    end
  end

  def show
    begin
      @session = Session.find(params[:id])
    rescue
      redirect_to root_path
    end
  end

  def valid_session
    raise
  end

  def update
    session = Session.first
    session.update!(is_valid: true)
  end
end
