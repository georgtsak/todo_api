class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: user.id)
      render json: { token: token }
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def destroy
    # Simply clear the token from the request headers
    request.headers['Authorization'] = nil
    head :no_content
  end
end
