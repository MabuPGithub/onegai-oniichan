class UsersController < ApplicationController
  def index
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.credentials.twitter[:consumer_key]
      config.consumer_secret     = Rails.application.credentials.twitter[:consumer_secret]
      config.access_token        = Rails.application.credentials.twitter[:access_token]
      config.access_token_secret = Rails.application.credentials.twitter[:access_token_secret]
    end

    @twitter_feed = client.user_timeline("GoodSmile_US")
  end

  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def nendoroids
    @nendos = Nendoroid.all.order(nendoroid_number: :desc)
  end

  def pre_orders
    @pre_orders = Nendoroid.where('release_date > ?', Time.now)
  end

  def in_stock
    @in_stock = Nendoroid.where(availability: true)
  end

  def view_nendo
    @nendo = Nendoroid.find(params[:id])
  end

  def order_nendo
    @nendo = Nendoroid.find(params[:id])
  end
    
  private
  def user_params
    params.require(:user).permit(:name, :email, :phone_number, :balance, :address)
  end
end