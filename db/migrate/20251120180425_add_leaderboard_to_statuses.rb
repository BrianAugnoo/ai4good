class AddLeaderboardToStatuses < ActiveRecord::Migration[8.0]
  def change
    add_column :statuses, :leaderboard, :boolean, default: false
  end
end
