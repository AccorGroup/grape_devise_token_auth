module GrapeDeviseTokenAuth
  class AuthorizerData
    attr_reader :uid, :client_id, :token, :expiry, :provider, :warden

    def initialize(uid, client_id, token, expiry, provider, warden)
      @uid = uid
      @client_id = client_id
      @token = token
      @expiry = expiry
      @provider = provider
      @warden = warden
    end

    def self.from_env(env)
      new(
        env[Configuration::UID_KEY],
        env[Configuration::CLIENT_KEY] || 'default',
        env[Configuration::ACCESS_TOKEN_KEY],
        env[Configuration::EXPIRY_KEY],
        env[Configuration::PROVIDER_KEY] || 'email',
        env['warden']
      )
    end

    def token_prerequisites_present?
      token && uid
    end
  end
end
