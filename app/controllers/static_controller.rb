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
end
