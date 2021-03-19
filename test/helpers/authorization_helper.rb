module AuthorizationHelper
  # def sign_up(user)
  #   # The argument 'user' should be a hash that includes the params 'email' and 'password'.
  #   post '/api/auth/sign_up/',
  #     params: { email: user[:email],
  #               password: user[:password],
  #               password_confirmation: user[:password],
  #               role: user[:role]
  #             },
  #     as: :json
  # end

  def auth_tokens_for_user(user)
    # The argument 'user' should be a hash that includes the params 'email' and 'password'.
    post '/api/auth/sign_in/',
      params: { email: user[:email], password: user[:password] },
      as: :json
    # The three categories below are the ones you need as authentication headers.
    response.headers.slice('client', 'access-token', 'uid')
  end
end
