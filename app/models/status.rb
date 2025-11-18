class Status < ApplicationRecord
  after_update_commit :eval_btn

  private
  def eval_btn
    broadcast_append_to "application",
                      target: "status-refresh",
                      partial: "partial/refresh"
  end
end
