module Formatter

  module UserFormatter
    def json_format
      {
        :name => self.github_name,
        :commit_count => self.commit_count
      }
    end    
  end

  module CommitFormatter
    def json_format
      {
        :name => self.user.github_name,
        :time => self.commit_time,
        :comment => self.comment,
        :repo => self.repo.name,
      }
    end
  end
end