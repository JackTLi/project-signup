OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do

	app_id = Figaro.env.FB_APP_ID
	app_secret = Figaro.env.FB_APP_SECRET

  provider :facebook, app_id, app_secret, {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end
