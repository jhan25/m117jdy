OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
 provider :google_oauth2, '474804107353-8v1ceddbe72lv7p94mcr0bfd043qmcbc.apps.googleusercontent.com', 'wVuALcW8wcamdBfuLshHUvnQ', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
