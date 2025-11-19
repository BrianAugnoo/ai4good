class CustomExaminersController < ApplicationController
  def create
    begin
      Examiner.create!(set_params)
      respond_to do |f|
        f.turbo_stream do
          render turbo_stream: turbo_stream.replace("setting-content", partial: "settings/examiner")
        end
      end
    rescue => e
      raise e
    end
  end

  def update
    begin
      examiner = Examiner.find(params[:id])
      if examiner.update(set_params)
        head :ok
      else
        render json: { error: "update failed params: #{params}" }, status: :unprocessable_entity
      end
    rescue => e
      render json: { error: e }, status: :unprocessable_entity
    end
  end

  def destroy
    begin
      examiner = Examiner.find(params[:id])
      if examiner.destroy
        render turbo_stream: turbo_stream.replace("setting-content", partial: "settings/examiner")
      else
        raise
      end
    rescue => e
      raise e
    end
  end

  private
  def set_params
    params.require(:examiner).permit(:name, :email, :password, :permited)
  end
end
