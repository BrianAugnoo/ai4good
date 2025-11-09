class AgeExaminersController < ApplicationController
  def create
    age_section = AgeSection.find(params[:age_examiner][:age_section_id].to_i)
    age_examiner = AgeExaminer.new
    age_examiner.examiner = Examiner.find(params[:age_examiner][:examiner_id].to_i)
    age_examiner.age_section = age_section
    if age_examiner.save
      validate_groups(age_section)
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
    age_section = age_examiner.age_section
    if age_examiner.destroy
      begin
        validate_groups(age_section)
        Criterium.joins(group: :age_section)
         .where(age_sections: { id: age_section.id }, examiner: age_examiner.examiner)
         .destroy_all
      rescue => e
        raise e
      end
      respond_to do |f|
        f.turbo_stream do
          render turbo_stream: turbo_stream.replace("setting-content", partial: "settings/age_sections")
        end
      end
    else
      raise
    end
  end

  private
  def validate_groups(age_section)
    age_section.groups.each do |group|
      group.validate_rate
    end
  end
end
