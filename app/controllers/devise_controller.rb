class DeviseController < ApplicationController
  def login
   @user = AdminUser.new
  end
  
  def new
    
  end
  
  def attemp_login
  if params[:email].present? && params[:password].present?
    found_user = AdminUser.where(:email => params[:email]).first
    if found_user
	authorized_user = found_user.authenticate(params[:password])
    end
  end
    if authorized_user
    flash[:notice] = "You are logged in"
    redirect_to(:action => 'index', :controller => 'Events')
    else
    flash[:notice] = "Invalid email/password "
    redirect_to(:action => "login")
    end
  end
  
  def logout
  flash[:notice] = "Logged out"
  redirect_to(:action => "index", :controller => 'Events')
  end
end
