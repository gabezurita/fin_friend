Rails.application.routes.draw do
  get 'pages/secret'

	resources :credit_cards

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Add a root route if you don't have one...
	# We can use users#new for now, or replace this with the controller and action you want to be the site root:
	root to: 'users#new'

	get 'users/show' => 'users#show'

  	# sign up page with form:
	get 'users/new' => 'users#new', as: :new_user

	# create (post) action for when sign up form is submitted:
	post 'users' => 'users#create'

	# log in page with form:
	get '/login'     => 'sessions#new'

	# create (post) action for when log in form is submitted:
	post '/login'    => 'sessions#create'

	# delete action to log out:
	delete '/logout' => 'sessions#destroy'

  # new transaction:
	get 'transactions/new'  => 'transactions#new'

	post 'transactions/new' => 'transactions#new'

	# create (post) transaction:
	post 'transactions/'    => 'transactions#create'
end
