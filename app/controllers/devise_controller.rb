class DeviseController < ApplicationController
before_action :confirm_logged_in, :except => [:login,:logout,:attemp_login]
  def login
   @user = AdminUser.new
  end
  
  def new
    
  end
  
  def attemp_login
   
  if params_email.present? && params_password.present?
    found_user = AdminUser.where(params_email).first
    if found_user
	authorized_user = found_user.authenticate(password)
    end
  end
    if authorized_user
	session[:user_id] = authorized_user.id
	session[:username] = authorized_user.First_name
    flash[:notice] = "You are logged in"
    redirect_to(:action => 'index', :controller => 'Events')
    else
    flash[:notice] = "Invalid email/password "
    redirect_to(:action => "login")
    end
  end
  
  def logout
  session[:user_id] = nil
  session[:username] = nil
  flash[:notice] = "Logged out"
  redirect_to(:action => "index", :controller => 'Events')
  end
  
  private
  
   def params_email
   params.require(:AdminUser).permit(:email)
   end
   
   def params_password
    params.require(:AdminUser).permit(:password)
   end
   
   def password
    AdminUser.new(params_password).password
   end
end
