Rails.application.routes.draw do

  root 'traps#index'
  match ":trap_id" => "traps#save_request", via: :all

end
