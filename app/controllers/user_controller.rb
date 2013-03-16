class UserController < ApplicationController
	layout "site"

  before_filter :protect, :only => :index

  def index
  	@title = "Trendit"
  end

  def register
  	@title = "Trendit"
    	if request.post? and params[:user]
    		@user = User.new(params[:user])
    		if @user.save
          session[:user_id] = @user.id
    			flash[:notice] = "Welcome, #{@user.full_name}!"
          redirect_to :action => "index", :controller => "site"
    		end
    	end
  end

  def login
    @title = "Trendit"
      if request.post? and params[:user]
          @user = User.new(params[:user])
          user = User.find_by_email_and_password(@user.email,@user.password)
          if user
            session[:user_id] = user.id
            flash[:notice] = "#{user.full_name}, you are now logged in!"
            redirect_to :action => "index"
          else
            # Don't show the password in the view.
            @user.password = nil
            flash[:notice] = "Invalid Email or Password!"
          end
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to :action => "register", :controller => "user"
  end

  private 

  def protect
    unless session[:user_id]
      flash[:notice] = "please log in first!"
      redirect_to :action => "register"
      return false
    end
  end

end