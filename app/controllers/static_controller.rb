class StaticController < ApplicationController
  def register
  end

  def login
  end

  def about_us
  end

  def contact_us
  end

  def home
    @title = "Welcome to your online wallet"
  end

  def mail

    id = 1

    MandrillMailer.welcome(id).deliver_now

    render :json => {:message => "done"}
  end
end
