module ApplicationHelper

  def title
    base_title = "Welcome to E-Wallet"

    if @title.nil?
      base_title
    else
      @title
    end
  end

end
