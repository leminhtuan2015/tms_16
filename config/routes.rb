Rails.application.routes.draw do
  get 'sessions/new'
  root 'static_pages#home'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users do  
    resources :subjects  
  end
  namespace :suppervisor do
    resources :users
    resources :subjects
  end
  resources :courses do
    resource :enrollments
    resource :course_subjects
  end
end