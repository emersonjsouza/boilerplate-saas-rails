module BoilerplateSaasRails

  SUBDOMAINS = %W{ www admin painel }

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
end

Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    # constraints(BoilerplateSaasRails::SubdomaininPresent) do
    #   unauthenticated do
    #     root 'devise/sessions#new', as: :unauthenticated__login_root
    #   end
    # end

    #constraints(BoilerplateSaasRails::SubdomaininBlack) do
      unauthenticated do
        root 'devise/registrations#new', as: :unauthenticated_root
      end
    #end
  end


  root "contacts#index"

end
