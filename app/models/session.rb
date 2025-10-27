class Session < ApplicationRecord
  belongs_to :admin
  belongs_to :group
  has_many :evals, dependent: :destroy
  has_many :examiners, through: :evals
  after_create_commit :display_btn
  after_update_commit :valid_session

  def self.status
    session = self.first
    if session.all_submited && session.is_valid
      3
    elsif session.all_submited
      2
    elsif session.is_valid
      1
    else
      0
    end
  end

  def self.examiner_connected
    self.first.examiners.count
  end

  def self.connection_completed?
    self.examiner_connected == Examiner.total
  end

  def clean!
    self.destroy
    Criterium.destroy_all
  end

  def refresh_projection
    broadcast_replace_to "home-projection",
                         target: "projection",
                         partial: "partial/projection"
  end

  private
  def display_btn
    broadcast_replace_to "exam-btn",
                          target: "join-exam-btn",
                          partial: "partial/join_btn",
                          locals: { session: self }

    self.refresh_projection
  end

  def valid_session
    status = Session.status
    if status == 3
      self.refresh_projection
      end_session
    elsif status == 1
      wait_examiner
      self.refresh_projection
    end
  end

  def wait_examiner
    broadcast_replace_to "eval-show-#{self.id}",
                          target: "admin-control",
                          partial: "partial/admin_control"
  end

  def end_session
    wait_examiner
    Examiner.all.each do |examiner|
      broadcast_replace_to "eval-show-#{self.id}",
                          target: "examiner-control-#{examiner.id}",
                          partial: "partial/examiner_control",
                          locals: { examiner: examiner }
    end
    self.destroy!
  end
end
