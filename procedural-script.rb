require 'octokit'
require 'pry'

# make a new client
# for the app, this will be done using oauth tokens from logged in users
client = Octokit::Client.new :login => '', :password => ''

# search through all of the client's repos and select those they are an admin of
owned_repos = client.repositories.select { |r| r.attrs[:permissions].attrs[:admin] }

# attach a hook to each repo
# whenever there is a push event to this repo, github will
# make a POST request to the url specified

owned_repos.each do |repo|
  begin
    client.create_hook(
      "#{repo.attrs[:full_name]}",
      "web",
      {
        :url => 'http://put_your.localtunnel.com/domain_here',
        :content_type => 'json'
      },
      {
        :events => ['push'],
        :active => true
      }
    )
    puts "Hook added for #{repo.attrs[:full_name]}"
  rescue Octokit::UnprocessableEntity => e
    puts e.message
    puts "\nSkipping"
  end
  sleep 5
end