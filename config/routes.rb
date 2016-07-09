class SubdomaininPresent
  def self.matches?(request)
    request.subdomain.present? && !SUBDOMAINS.include?(request.subdomain)
  end
end

class SubdomaininBlack
  def self.matches?(request)
    request.subdomain.blank? || SUBDOMAINS.include?(request.subdomain)
  end
end

Rails.application.routes.draw do

  constraints(SubdomaininPresent) do
    root 'contacts#index'
    resources :contacts

    devise_for :users
    devise_scope :user do
        unauthenticated do
          root 'devise/sessions#new', as: :unauthenticated__login_root
      end
    end
  end

  constraints(SubdomaininBlack) do
    root 'accounts#new', as: :unauthenticated_root
    resources :accounts, only: [:new, :create]
  end
end
