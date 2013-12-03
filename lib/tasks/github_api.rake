namespace :github_api do
  task :call => :environment do
    
    puts "Retrieving all new push events for all users"

    @users = User.all

    @users.each do |user|
      APICaller.run(user)
    end
    
  end
end