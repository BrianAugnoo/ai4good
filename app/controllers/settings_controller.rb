class SettingsController < ApplicationController
  def admin
  end

  def examiner
    respond_to do |f|
      f.turbo_stream do
        render turbo_stream: turbo_stream.replace("setting-content", partial: params[:partial])
      end
    end
  end

  def age_sections
    raise
  end
end
