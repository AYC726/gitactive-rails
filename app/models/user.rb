class User < ActiveRecord::Base
  has_many :commits
  has_many :repos, :through => :commits

  def self.commit_leader
    User.order("commit_count DESC").limit(1).first
  end

end
