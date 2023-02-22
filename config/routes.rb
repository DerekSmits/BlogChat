Rails.application.routes.draw do
  match '*path', to: 'errors#not_found', via: :all
end
