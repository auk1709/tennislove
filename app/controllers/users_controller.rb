class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :edit]
  
  def index
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
    
  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    
    @user.image_name = "#{@user.id}.jpg"
    image = params[:image]
    if image.present?
      File.binwrite("public/user_images/#{@user.image_name}",image.read)
    end
    if @user.update(params[:user][:password_confirmation].present? ? user_params : user_params_without_password)
      flash[:success] = 'プロフィールを変更しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'プロフィールを変更できませんでした。'
      render :edit
    end
  end
  
  def destroy
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile)
  end
  def user_params_without_password
    params.require(:user).permit(:name, :email, :profile)
  end
  
 
end
