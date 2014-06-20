RspecApiDocumentation.configure do |config|
  config.format = [:json, :combined_text]
  config.docs_dir = Rails.root.join("doc", "api")
  config.curl_host = 'http://supracefinder.com'
end

def authorized_user!(opts={})
  Fabricate(:user).tap do |user|
    token = opts[:invalid_token].present? ? "iNv@lidT0K3N" : user.api_token
    header "AUTHORIZATION", ActionController::HttpAuthentication::Token.encode_credentials(token)
  end
end
