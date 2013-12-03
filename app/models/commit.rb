class Commit < ActiveRecord::Base
  belongs_to :user
  belongs_to :repo

  before_create :increment_user_count

  private
  def increment_user_count
    self.user.increment!(:commit_count)
  end

end
