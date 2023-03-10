# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create
  before_action :find_user, except: :create

  def show
    render json: @user, serializer: UserSerializer, status: :ok
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    return if @user.update(user_params)

    render json: { errors: @user.errors.full_messages },
           status: :unprocessable_entity
  end

  def destroy
    @user.destroy
  end

  private

  def find_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'User not found' }, status: :not_found
  end

  def user_params
    params.require(:user).permit(
      :name, :username, :email, :password, :password_confirmation
    )
  end
end
