module OmniAuthHelpers
    def set_omniauth(service = :google_oauth2)
        OmniAuth.config.test_mode = true

        OmniAuth.config.mock_auth[service] = OmniAuth::AuthHash.new({
            # provider: service.to_s,
            # uid: '1',
            # info: {
            #     name: 'hoge',
            #     image: "https://test.com/test.png"
            # }
            Faker::Omniauth.google
        })
    end
end