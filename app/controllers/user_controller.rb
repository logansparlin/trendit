class UserController < ApplicationController
	layout "site"
  def index
  	@title = "Trendit"
  end

  def register
  	@title = "Trendit"
  	if request.post? and params[:user]
  		@user = User.new(params[:user])
  		if @user.save
  			flash[:notice] = "User #{@user.full_name} created!"
        redirect_to :action => "index"
  		end
  	end
  end
end
