ActionController::Routing::Routes.draw do |map|

  map.resources :borrows,:books,:users,:libraries

  map.resources :sessions, :only => [:new, :create, :destroy]

  map.signin '/signin', :controller => 'sessions', :action => 'new' 
  map.signout '/signout', :controller => 'sessions', :action => 'destroy'
  
  map.root :controller => 'pages', :action => 'home'
  map.contact '/contact', :controller => 'pages', :action => 'contact'
  map.about   '/about',   :controller => 'pages', :action => 'about'
  map.help    '/help',    :controller => 'pages', :action => 'help'

  map.signup '/signup', :controller => 'users', :action => 'new'


  map.add '/add', :controller => 'libraries', :action => 'new'
  map.show '/show', :controller => 'libraries', :action => 'show'
  map.search2 '/show', :controller => 'libraries', :action => 'show'
  map.addbooks  '/addbooks', :controller => 'books', :action => 'addbooks'
  map.addb  '/addb', :controller => 'books', :action => 'add'
  map.searchbooks  '/searchbooks', :controller => 'books', :action => 'searchbooks'
  map.bookname '/bookname', :controller => 'books', :action => 'bookname'
  map.allbooks '/allbooks', :controller => 'books', :action => 'allbooks'

  map.issue '/issue', :controller => 'borrows', :action => 'issue'
  map.returnbooks '/returnbooks', :controller => 'borrows', :action => 'returnbooks'
  map.historyuser '/historyuser', :controller => 'borrows', :action => 'historyuser'
  map.historyadmin '/historyadmin', :controller => 'borrows', :action => 'historyadmin'

  map.returnlibrary '/returnlibrary', :controller => 'borrows', :action => 'returnlibrary'
  map.renewlibrary '/renewlibrary', :controller => 'borrows', :action => 'renewlibrary'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end