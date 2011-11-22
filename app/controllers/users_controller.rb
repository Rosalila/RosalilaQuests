class UsersController < ApplicationController 

  def new   
    @user = User.new   
  end   
   
  def create   
    @user = User.new(params[:user])
    if User.count==0
      @user.id=1
    else
      @user.id=User.all[User.count-1].id+1
    end
    if @user.save   
      redirect_to root_url, :notice => "Signed up!"   
    else   
      render "new"   
    end   
  end   
end
