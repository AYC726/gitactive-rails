class CommitsController < ApplicationController

  def index
    @commits = Commit.recent_commits(3)
    @leader = User.commit_leader
  end

  def json
    @commits = Commit.recent_commits(3)
    @leader = User.commit_leader

    json_hash = {
      :commits => @commits.map(&:json_format),
      :leader => @leader.json_format
    }

    respond_to do |format|
      format.json { render :json => json_hash }
    end
  end
end