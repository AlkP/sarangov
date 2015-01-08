Rails.application.routes.draw do

  root 'traps#index'
  get ":trap_id/requests" => "traps#show_requests"
  get ":trap_id/requests/:id" => "traps#show"
  match ":trap_id" => "traps#save_request", via: :all

end
