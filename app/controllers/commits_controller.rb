class CommitsController < ApplicationController

  def index
    @commits = Commit.recent_commits(3)
    @leader = User.commit_leader

    respond_to do |format|
      format.html
      format.json { render :json => json_hash }
    end
  end

  private
  def json_hash
    {
      :commits => @commits.map(&:json_format),
      :leader => @leader.json_format
    }
  end
end