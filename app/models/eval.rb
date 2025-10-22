class Eval < ApplicationRecord
  belongs_to :examiner
  belongs_to :session
  after_create_commit :active_member, :display_control
  after_update_commit :valid_eval

  private
  def active_member
    broadcast_replace_to "eval-show-#{self.session.id}",
                         target: "active-member",
                         partial: "eval_sessions/active_member",
                         locals: { examiner_count: self.session.examiners.count }
  end

  def display_control
    if Session.connection_completed?
      broadcast_replace_to "eval-show-#{self.session.id}",
                          target: "admin-control",
                          partial: "partial/admin_control"

      Examiner.all.each do |examiner|
        display_examiner_control(examiner)
      end
    end
  end

  def display_examiner_control(examiner)
    broadcast_replace_to "eval-show-#{self.session.id}",
                          target: "examiner-control-#{examiner.id}",
                          partial: "partial/examiner_control",
                          locals: { examiner: examiner }
  end

  def valid_eval
    display_examiner_control(self.examiner)

    if self.session.evals.pluck(:done).all?
      self.session.update!(all_submited: true)
    end
  end
end
