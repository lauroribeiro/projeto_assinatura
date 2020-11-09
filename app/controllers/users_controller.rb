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
    @request = Request.find(@user.request_id)
    @user.signed = true
    if @user.update(user_signature_params)
      # @request.update(set_state(@request))
      redirect_to request_path(@user.request_id)
    else
      render 'edit'
    end
  end

  def edit
    # @request = Request.find(params[:request_id])
    @user = User.find(params[:id])
  end

  # def refuse
  #   @user = User.find(params[:user_id])
  #   # @user.reason = params
  #   # @user.update(params.require(:user).permit(:reason))
  #   # redirect_to request_path(@user.request_id)
  # end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
  def user_signature_params
    params.require(:user).permit(:signature)
  end



end