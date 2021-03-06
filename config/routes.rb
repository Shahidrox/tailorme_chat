TailormeChat::Application.routes.draw do
  
  get "/chat_room/:id/" => "chats#index", :as => :chat_room
  get "welcome" => "users#welcome"
  # post "/messages/create_message"
  # post "/messages/auto_load_chat"
  post "/users/create_message"
  post "/users/auto_load_chat"
  get  "message" => "users#message_notification"
  get  "shop_client" => "users#people"
  
  get "home" => "home#index"
  root 'home#index'

  get 'auth/:provider/callback', to: 'authentication#fb_create'
  get 'auth/failure', to: redirect('/')

  post "authentication/save_shop"
  post "users/save_title"
  
  get "sign_in" => "authentication#sign_in"
  post "sign_in" => "authentication#login"
  get "signed_out" => "authentication#signed_out"
  
  get "new_user" => "authentication#new_user"
  put "new_user" => "authentication#register"

  get "account_settings" => "authentication#account_settings"
  put "account_settings" => "authentication#set_account_info"

  get "shop_message" => "users#message_shop"
  post "users/create_message_shop"

  get "client_reply" => "users#client_reply"
  
  post "send_email" => "users#email"
  
  get "visits_list" => "users#visits"

  post "/users/is_seen_method"
  post "/users/chek_notification"

  # Routes For ios 
  post 'iphone', to: 'ios_iphone#android'
  post "add_shop_name" => "ios_iphone#save_shop_ios"

  post "send_msg_to_shop" => "ios_iphone#create_message_shop_ios"
  post "iphone_inbox" => "ios_iphone#message_notification_ios"

  post "create_chat" => "ios_iphone#create_message_ios"
  post "show_chat" => "ios_iphone#load_messages"

  post "load_tailors" => "ios_iphone#load_tailors"
  
  post "send_email_to_iphone" => "ios_iphone#email_io7"
end
