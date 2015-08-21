ActionController::Routing::Routes.draw do |map|
  map.resources :borrows

  map.resources :books

  map.resources :books

  map.resources :users

  map.resources :sessions, :only => [:new, :create, :destroy]
  map.signin '/signin', :controller => 'sessions', :action => 'new' 
  map.signout '/signout', :controller => 'sessions', :action => 'destroy'

  map.root :controller => 'pages', :action => 'home'
  map.contact '/contact', :controller => 'pages', :action => 'contact'
  map.about   '/about',   :controller => 'pages', :action => 'about'
  map.help    '/help',    :controller => 'pages', :action => 'help'

  map.signup '/signup', :controller => 'users', :action => 'new'


  map.bookshome '/bookshome', :controller => 'books', :action => 'bookshome'
  map.addbooks  '/addbooks', :controller => 'books', :action => 'addbooks'
  map.searchbooks  '/searchbooks', :controller => 'books', :action => 'searchbooks'
  map.bookname '/bookname', :controller => 'books', :action => 'bookname'
  map.allbooks '/allbooks', :controller => 'books', :action => 'allbooks'

  map.issue '/issue', :controller => 'borrows', :action => 'issue'
  map.returnbooks '/returnbooks', :controller => 'borrows', :action => 'returnbooks'
  map.returnlibrary '/returnlibrary', :controller => 'borrows', :action => 'returnlibrary'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
