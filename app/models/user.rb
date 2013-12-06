class User < ActiveRecord::Base
  include Formatter::UserFormatter
  
  has_many :commits
  has_many :repos, :through => :commits

  def self.commit_leader
    User.order("commit_count DESC").detect {|u| u.commit_count }
  end
end
