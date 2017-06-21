module Requests
  module JsonHelpers
    def json
      JSON.parse(response.body)
    end

    def logged_in_headers
      login = {
        email: "user@example.com",
        password: "asdqwe123"
      }

      post api_v1_user_session_path, params: login

      headers_params = {
        "Access-Token": headers['access-token'],
        "Client": headers['client'],
        "Uid": headers['uid']
      }
    end
  end
end
