class EstablishmentCriterium < ApplicationRecord
  belongs_to :examiner
  belongs_to :establishment

  after_create_commit :refresh_estb
  after_update_commit :refresh_estb

  private
  def refresh_estb
    broadcast_append_to "application",
                      target: "estb-show",
                      partial: "partial/refresh"
  end
end
