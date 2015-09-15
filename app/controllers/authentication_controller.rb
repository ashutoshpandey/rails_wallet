class AuthenticationController < ApplicationController
  def do_login

    @email = params[:email]
    @password = params[:password]

    @user = User.where(:email => @email, :password => @password).first

    if @user
      render :json => {:message => 'correct'}
    else
      render :json => {:message => 'wrong'}
    end
  end
end
