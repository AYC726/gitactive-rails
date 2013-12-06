class AddCommitCountIndexToUsers < ActiveRecord::Migration
  def change
    add_index :users, :commit_count
  end
end
