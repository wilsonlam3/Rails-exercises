class RoleController < ApplicationController

  def show
    @role = Role.find(params[:id]) 
    @users=@role.users
  end

  def create
    @user = User.new(params[:user])
    @role = Role.find(:all, :conditions=>"name='Registered'") 
    @user.role_id = @role.id
    if @user.save
      flash[:notice] = 'User was successfully created.'
         redirect_to :action => 'list'
    else
         render :action => 'new'
    end
  end

  def display_assign
    @users = User.find(:all)
    @roles = Role.find(:all)
  end

  def assign
    @user = User.find(params[:id])
    if @user.upadate_attribute :role_id,params[:role]
      flash[:notice] = 'User was successfully assigned the role.'
         redirect_to :action => 'list'
    else
      flash[:notice] = 'Role could not be assigned to the selected user.'
         render :action=>'display_assign'
    end 
  end

end
