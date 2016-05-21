Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, ENV["SPOTIFY_CLIENT_ID"], ENV["SPOTIFY_CLIENT_SECRET"]

# OmniAuth.config.test_mode = true
# known_user = { 'provider' => 'spotify',
#                   'uid' => '12345',
#                   'info' => {
#                       'name' => 'person',
#                       'id' => '9999'
#                   }
# }
 
# OmniAuth.config.add_mock(:spotify, known_user)
end