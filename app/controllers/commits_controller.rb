class CommitsController < ApplicationController

  def index
    @commits = Commit.recent_commits(3)
    @leader = User.commit_leader
  end
end
