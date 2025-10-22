class EvalsController < ApplicationController
  def create
    session_id = params[:eval][:session_id]
    @eval = Eval.new(session_id: session_id)
    @eval.examiner = current_examiner

    if @eval.save
      redirect_to eval_session_path(Session.find(session_id))
    else
      raise
    end
  end
end
