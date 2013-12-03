class User < ActiveRecord::Base
  has_many :commits
  has_many :repos, :through => :commits
end
