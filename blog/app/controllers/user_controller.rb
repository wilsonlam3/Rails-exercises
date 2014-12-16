class UserController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to articles_path, notice: 'User successfully added.'
    else
      render action: :new
    end
end

  def edit
    @user = current_user
end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to articles_path, notice: 'Updated user information successfully.'
    else
      render action: 'edit'
end 
end
  private
  def set_user
    @user = current_user
  end
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
end 

end
