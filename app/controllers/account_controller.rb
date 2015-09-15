class AccountController < ApplicationController

  def create

    @email = params[:email]

    @existing_user = User.find_by_email(email)

    if @existing_user
      render :json => {:message => 'duplicate'}
    else
      @user = User.new

      @user.email = params[:email]
      @user.name = params[:name]
      @user.gender = params[:gender]

      @user.save

      render :json => {:message => 'done'}
    end
  end

  def edit
    @user_id = session[:user_id]

    @user = User.find(user_id)

    if not user
      return redirect_to '/'
    end
  end

  def update
    @user_id = session[:user_id]

    @user = User.find(user_id)

    if not user
      render :json => {:message => 'invalid'}
    else
      @user.email = params[:email]
      @user.name = params[:name]
      @user.gender = params[:gender]

      @user.save
    end
  end

  def delete
    @user_id = session[:user_id]

    @user = User.find(user_id)

    if @user
      @user.delete

      render :json => {:message => 'done'}
    else
      render :json => {:message => 'invalid'}
    end
  end

  def withdraw
    @user_id = session[:user_id]

    @wallet = Wallet.find_by_user_id(user_id)

    if not @wallet
      return redirect_to '/'
    end
  end

  def deposit
    @user_id = session[:user_id]

    if @user_id

      @wallet = Wallet.find_by_user_id(user_id)

    end
  end

  def doDeposit
    @user_id = session[:user_id]

    if @user_id

      @wallet = Wallet.where(user_id: @user_id).first

      if @wallet

        @amount = params[:amount]

        @wallet.balance = @wallet.balance + amount

        @wallet.save

        @wallet_transaction = WalletTransaction.new
        @wallet_transaction.amount = amount
        @wallet_transaction.transaction_type = 'deposit'
        @wallet_transaction.save

        render :json => {:message => 'done'}

      end
    else
      render :json => {:message => 'invalid'}
    end
  end

  def doWithdraw
    @user_id = session[:user_id]

    if @user_id

      @wallet = Wallet.find_by_user_id(user_id)

      if @wallet

        @amount = params[:amount]

        @wallet.balance = @wallet.balance - amount

        @wallet.save

        @wallet_transaction = WalletTransaction.new

        @wallet_transaction.amount = amount
        @wallet_transaction.transaction_type = 'withdraw'

        @wallet_transaction.save

        render :json => {:message => 'done'}

      end
    else
      render :json => {:message => 'invalid'}
    end
  end

  def transactions
    @user_id = session[:user_id]

    if @user_id
      @transactions = WalletTransaction.where(user_id: @user_id).all
    else
      return redirect_to '/'
    end

  end
end
