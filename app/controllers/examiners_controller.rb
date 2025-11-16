class ExaminersController < ApplicationController
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

  private
  def set_params
    params.require(:examiner).permit(:name, :email, :password)
  end
end
