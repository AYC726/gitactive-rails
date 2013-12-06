class CommitsController < ApplicationController

  def index
  end

  def json
    @commits = Commit.recent_commits(3)
    @leader = User.commit_leader
    render :json => json_hash
  end

  private
  def json_hash
    {
      :commits => @commits.map(&:json_format),
      :leader => @leader.json_format
    }
  end
end