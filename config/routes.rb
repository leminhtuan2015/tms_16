Rails.application.routes.draw do
  get 'sessions/new'
  root 'static_pages#home'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users do
  end
  namespace :suppervisor do
    resources :users
  end

  resources :courses do
    resource :course_subjects
    resource :enrollments
  end

  resources :subjects do
    resources :tasks 
  end
end