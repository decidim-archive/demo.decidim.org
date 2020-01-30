Rails.application.routes.draw do
  
  # Letter Openner for production as this is a Demo/Try installation
  mount LetterOpenerWeb::Engine, at: "/letter_opener"

  mount Decidim::Core::Engine => '/'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
