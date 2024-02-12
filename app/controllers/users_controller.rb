class UsersController < ApplicationController
  def create
    if existing_user = User.find_by(email: user_params[:email])
      render json: { error: "Email has already been taken" }, status: :unprocessable_entity
      return
    end

    user = User.new(user_params)
    if user.save
      render json: { message: 'User created successfully' }, status: :created
    else
      render json: { error: user.errors.full_messages.join(', ') }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
