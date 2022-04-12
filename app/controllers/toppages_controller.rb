class ToppagesController < ApplicationController
  before_action :require_user_logged_in, only: [:edit,]
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  def index
    @pagy, @users = pagy(User.order(id: :desc), items: 25)
  end
  
  def edit
  end
  
end
