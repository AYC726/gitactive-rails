class APICaller
  @@client ||= Octokit::Client.new :client_id => ENV['GITHUB_CLIENT_ID'], :client_secret => ENV['GITHUB_CLIENT_SECRET']

  def self.run(user)
    result = @@client.user_public_events(user.github_name)

    new_push_events = result.select do |event|
      if user.scrape_time.nil?
        event.attrs[:type] == "PushEvent"
      else
        (event.attrs[:type] == "PushEvent") && (event[:created_at] > user.scrape_time)
      end
    end

    user.update(scrape_time: Time.now)

    new_push_events.each do |new_push_event|
      repo = Repo.find_or_create_by(name: new_push_event.attrs[:repo].attrs[:name])
      commit_time = new_push_event.attrs[:created_at]

      new_push_event[:payload].attrs[:commits].each do |commit|
        comment = commit.attrs[:message]
        sha = commit.attrs[:sha]

        user.commits.create(comment: comment, sha: sha, repo: repo, commit_time: commit_time)
      end
    end
  end

end

