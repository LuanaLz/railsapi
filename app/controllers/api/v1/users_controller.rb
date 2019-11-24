class Api::V1::UsersController < ApplicationController
  respond_to :json
  acts_as_token_authentication_handler_for User

  before_action :require_authentication!

  # skip_before_filter :verify_authenticity_token

  def show
    respond_with User.find(params[:id])
  end

  # Creating users
  def create
    user=User.new(user_params)

    if user.save
      render json: user, status: 201
    else
      render json: { errors: user.errors}, status: 422
    end
  end

  # Updating users
  def update
    user = User.find(params[:id])

    if user.update(user_params)
      render json: user, status: 200
    else
      render json: { errors: user.errors }, status: 422
    end
  end

  # Deleting users
  def destroy
    user = User.find(params[:id])
    user.destroy
    head 204
  end

  private

  def user_params
   params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def require_authentication!

    throw(:warden, scope: :user) unless current_user.presence

  end
end
