class UsersController < ApplicationController
  def index

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
    
  private
  def user_params
    params.require(:user).permit(:name, :email, :phone_number, :balance, :address)
  end
end