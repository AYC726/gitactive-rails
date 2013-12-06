GitactiveRails::Application.routes.draw do
  
  root 'commits#index'
  get 'commits' => "commits#json"

end
