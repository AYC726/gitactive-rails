namespace :github_api do
  task :call => :environment do
    
    puts "Retrieving all new push events for all users"

    9.times do 
      @users = User.all

      @users.each do |user|
        APICaller.run(user)
      end
      sleep 60
    end
    
  end
end