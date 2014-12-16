class Role < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  has_many :users

  def assign
    @user= User.find(params[:id])
    if @user.update_attribute :role_id,params[:role]
      flash[:notice] = 'User was successfully assigned the role.'
         redirect_to :action => 'list'
    else
      flash[:notice] = 'Role could not be assigned to the selected user.'
         render :action=>'display_assign'
    end
  end

end
