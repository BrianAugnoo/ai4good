class CriteriumController < ApplicationController
  def create
    Criterium.criteria_list.each do |criterium_name|
      Criterium.create!(name: criterium_name, values: params[criterium_name], group_id: Session.first.group.id, examiner_id: current_examiner.id)
    end
    @eval = current_examiner.evals[0]
    @eval.update!(done: true)
    # redirect_to eval_session_path(@eval.session)
  end
end
