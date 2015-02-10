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
    member do
      get 'add_subject'
      get 'assign_user'
    end
    resources :enrollments do
    end
  end

  resources :subjects do
     member do
      get 'assign_tasks'
      get 'edit_tasks'
      get 'task_detail'
      get 'task_edit'
    end
    resources :tasks do
    end
  end

  resources :course_subjects do
  end

  resources :tasks do
  end
end