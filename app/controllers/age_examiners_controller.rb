class AgeExaminersController < ApplicationController
  def create
    age_examiner = AgeExaminer.new
    age_examiner.examiner = Examiner.find(params[:age_examiner][:examiner_id].to_i)
    age_examiner.age_section = AgeSection.find(params[:age_examiner][:age_section_id].to_i)
    if age_examiner.save
      respond_to do |f|
        f.turbo_stream do
          render turbo_stream: turbo_stream.replace("setting-content", partial: "settings/age_sections")
        end
      end
    else
      raise
    end
  end

  def destroy
    age_examiner = AgeExaminer.find(params[:id])
    if age_examiner.destroy
      respond_to do |f|
        f.turbo_stream do
          render turbo_stream: turbo_stream.replace("setting-content", partial: "settings/age_sections")
        end
      end
    else
      raise
    end
  end
end
