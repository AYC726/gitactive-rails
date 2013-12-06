GitactiveRails::Application.routes.draw do
  
  root 'commits#index'
  get 'commits.:format' => "commits#json", :constraints => {:format => /json/}

end
