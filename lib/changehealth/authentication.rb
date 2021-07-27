require 'base64'
require 'httparty'

module ChangeHealth
  class Authentication
    def access_token
      @access_token ||= persisted_access_token || fetch_access_token
    end

    def refresh_access_token!
      @access_token = fetch_access_token
    end

    def oauth_domain
      if ChangeHealth.configuration.production?
        "apis.changehealthcare.com"
      else
        "sandbox.apis.changehealthcare.com"
      end
    end

    protected

    def fetch_access_token
      response = ::HTTParty.post(oauth_grant_url, headers: oauth_headers, body: oauth_body.to_json)
      new_token =
        if response.code == 200 && response.content_type == 'application/json'
          response&.parsed_response&.fetch('access_token', nil)
        end

      if new_token.nil?
        Rails.logger.info("---Viet--")
        Rails.logger.info("---??-- #{response&.parsed_response}")
        raise ::ChangeHealth::AuthError, "There was a problem obtaining a ChangeHealth access token from: #{oauth_grant_url}"
      end

      ChangeHealth.configuration.persist_token&.call(new_token)
      new_token
    end

    def persisted_access_token
      ChangeHealth.configuration.persisted_token&.call
    end

    def oauth_grant_url
      "https://#{oauth_domain}/apip/auth/v2/token"
    end

    def oauth_headers
      { 'Content-Type' => 'application/json' }
    end

    def oauth_body
      { 
        'grant_type' => 'client_credentials',
        'client_id' => ChangeHealth.configuration.client_id,
        'client_secret' => ChangeHealth.configuration.client_secret
      }
    end
  end
end