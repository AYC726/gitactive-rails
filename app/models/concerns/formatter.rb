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

    def formatted_time
      commit_time.in_time_zone('Eastern Time (US & Canada)').strftime("%l:%M:%S").strip
    end

    def json_format
      {
        :name => self.user.github_name,
        :time => self.formatted_time,
        :comment => self.comment,
        :repo => self.repo.name,
      }
    end
  end
end