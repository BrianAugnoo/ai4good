class StatusesController < ApplicationController
  def update
    status = Status.first
    if status.update(status_params)
      head :ok
    else
      render json: { error: "update failed" }, status: :unprocessable_entity
    end
  end

  private

  def status_params
    params.require(:status).permit(:first_rate, :second_rate, :edit_rate)
  end
end
