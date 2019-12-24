module LoginUser
  def sign_in_user(user=nil)
    # Mimic the router behavior of setting the Devise scope through the env.
    @request.env['devise.mapping'] = Devise.mappings[:user]
    # Use the sign_in helper to sign in a factory `User` record.
    user = user || create(:user)
    sign_in user
  end
end