class APICaller
  @@client ||= Octokit::Client.new :access_token => ENV['GITHUB_ACCESS_TOKEN']

  def self.run(user)
    begin 
     result = @@client.user_public_events(user.github_name)

     new_push_events = result.select do |event|
       if user.call_time.nil?
         event.attrs[:type] == "PushEvent"
       else
         (event.attrs[:type] == "PushEvent") && (event[:created_at] > user.call_time)
       end
     end

     user.update(call_time: Time.now)
     build_commits(new_push_events,user)

    rescue => e
      Rails.logger.error "Error grabbing events from user"
      Rails.logger.error e.message
    end
  end

  def self.build_commits(new_push_events,user)
    new_push_events.each do |new_push_event|
      begin
        repo = Repo.find_or_create_by(name: new_push_event.attrs[:repo].attrs[:name])
        commit_time = new_push_event.attrs[:created_at]

        new_push_event[:payload].attrs[:commits].each do |commit|
          comment = commit.attrs[:message]
          sha = commit.attrs[:sha]
          user.commits.create(comment: comment, sha: sha, repo: repo, commit_time: commit_time)
        end
      rescue => e
        Rails.logger.error "Error parsing event into Commit object"
        Rails.logger.error e.message
      end
    end
  end
end