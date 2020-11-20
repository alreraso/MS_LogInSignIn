class UsersController < ApplicationController
  
  #before_action :set_user, only: [:show]

  def show 
	  @user = User.find_by email: params[:email]
    render json: @user 
    #render :json=> @user.as_json(:tokens=>@user.tokens)
    #render :json=> @user.as_json(:token=>@user.tokens)
  end

  def index
    @user = User.all
    render json: @user
  end 

  private
    def set_user
      @user = User.find(params[:email])
    end
  
    def user_params
      params.require(:user).permit(:email)
    end
end
