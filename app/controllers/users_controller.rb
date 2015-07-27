class UsersController < ApplicationController
  def new
  @User = AdminUser.new({:First_name => "First_name"})
  end
  
  def index
  @User = AdminUser.all
  end

  def show
  @User = AdminUser.find(params[:id])
  end

 def create
  @User = AdminUser.new(user_params)
  if @User.save
   flash[:notice] = "user created"
   redirect_to(:action => 'index',:controller => 'Events', :First_name => @User.First_name, :id => @User.id)
   else
   render('new')
   end
  end
  
  def edit
  @User = AdminUser.find(params[:id])
    if @User.update_attributes(secure_params)
	flash[:notice] = "User updated successfully"
     redirect_to(:action => 'show', :id => @User.id)
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end
  
   def delete
    @User = AdminUser.find(params[:id])
    @User.destroy
	flash[:notice] = "'#{params[:First_name]}'"
    redirect_to users_path, :notice => "User deleted."
  end
  
   private 
  
   def user_params
   params.require(:AdminUser).permit(:First_name, :email, :password, )
   end
  
end
