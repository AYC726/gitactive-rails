class Commit < ActiveRecord::Base
  include Formatter::CommitFormatter
  
  belongs_to :user
  belongs_to :repo

  scope :recent_commits, ->(num) { order("commit_time DESC").limit(num) }

  before_create :increment_user_count

  private
  def increment_user_count
    self.user.increment!(:commit_count)
  end

end
