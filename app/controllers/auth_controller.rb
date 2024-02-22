class AuthController < ApplicationController

  def login
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      render json: { user: user, message: 'Successful login' }, status: :ok
    else
      render json: { message: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def logout
    render json: { message: 'Logout successful' }, status: :ok
  end
end
