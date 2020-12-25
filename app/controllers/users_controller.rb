class UsersController < ApplicationController
  def index
    @users = User.order(id: :desc).page(params[:page]).per(25)
  end

  def new
  end

  def create
  end

  def show
  end
end
