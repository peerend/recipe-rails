Rails.application.routes.draw do
  match('/', {:via => :get, :to => 'entries#index'})
  match('/new-entry', {:via => :get, :to => 'entries#new'})
  match('/entries', {:via => :post, :to => 'entries#create'})
  match('/entries/:id', {:via => [:patch, :put], :to => 'entries#update'})
  match('/new-tag', {:via => :get, :to => 'tags#index'})
  match('/tags', {:via => :post, :to => 'tags#create'})
  match('/edit/:id', {:via => :get, :to => 'entries#edit'})
  match('/tags/:id', {:via => :get, :to => 'tags#show'})
  match('/:id', {:via => :get, :to => 'entries#show'})
  match('/ratings/:id', {:via => :post, :to => 'ratings#create'})
end
