class SignupController < ApplicationController
  def create
    if existing_user = User.find_by(email: user_params[:email])
      render json: { error: "Email has already been taken" }, status: :unprocessable_entity
      return
    end

    user = User.new(user_params)

    user.password_confirmation = user_params[:password_confirmation]

    if user.save
      render json: user, status: :created
    else
      render json: { error: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:signup).permit(:email, :password, :password_confirmation)
  end
end
