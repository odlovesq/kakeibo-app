Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope :api, defaults: { format: 'json' } do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: '/auth', controllers: {
          registrations: 'api/v1/auth/registrations'
      }
      post 'household_account_book', to: 'api/v1/household_account_books#create'
    end
  end
end
