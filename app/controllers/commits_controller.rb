class CommitsController < ApplicationController

  def index
    @commits = Commit.order("commit_time DESC").limit(3)
    @leader = User.order("commit_count DESC").limit(1).first
  end
end
