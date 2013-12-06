GitactiveRails::Application.routes.draw do
  
  root 'commits#index'
  get 'commits.:format' => "commits#index", :constraints => {:format => /json/}

end
