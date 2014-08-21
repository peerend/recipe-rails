Rails.application.routes.draw do
  match('/', {:via => :get, :to => 'entries#index'})
  match('/new-entry', {:via => :get, :to => 'entries#new'})
  match('/entries', {:via => :post, :to => 'entries#create'})
end
