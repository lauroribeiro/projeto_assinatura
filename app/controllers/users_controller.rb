class UsersController < ApplicationController

  def new
    @user = User.new
    
  end
  def create
    @request = Request.find(params[:request_id])
    @user = @request.users.create(user_params)
    if !@user.nil?
      UserMailer.notify_email(@user).deliver_later
    end
    redirect_to request_path(@request)
  end

  def update
    # @request = Request.find(params[:request_id])
    @user = User.find(params[:id])
    if @user.update(user_signature_params)
      redirect_to request_path(@user.request_id)
    else
      render 'edit'
    end
  end

  def edit
    # @request = Request.find(params[:request_id])
    @user = User.find(params[:id])
  end

  def destroy
    @request = Request.find(params[:request_id])
    @user = @request.users.find(params[:id])
    @user.destroy

    redirect_to request_path(@request)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
  def user_signature_params
    params.require(:user).permit(:signature)
  end
end