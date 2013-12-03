class APICaller

  attr_accessor :user, :results

  @@client = #TODO Some API Thing

  def initialize(user)
    @results = call_user(user)
  end

  def call_user(user)
    results = @@client.user_public_events user 

    #filter their events by Time and type
    #build a commit for each one

  end

  def build_commit
  end

  #Given a user
  #Filter their 30 results
  #For each qualifying result,
  #  run a method which turns that hash
  #  into a commit

end