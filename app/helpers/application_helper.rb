module ApplicationHelper
  def who_is_connected?
    if admin_signed_in?
      "admin"
    elsif examiner_signed_in?
      "examinateur"
    else
      "invite"
    end
  end

  def dashboard_path
    if admin_signed_in?
      admin_dashboard_path
    elsif examiner_signed_in?
      examiner_dashboard_path
    end
  end

  def deconnect_path
    if admin_signed_in?
      destroy_admin_session_path
    elsif examiner_signed_in?
      destroy_examiner_session_path
    end
  end

  def status
    Status.first
  end

  def categories
    CriteriumCategory.categories.map do |key, value|
      CriteriumCategory.where(name: key).first
    end
  end
end
