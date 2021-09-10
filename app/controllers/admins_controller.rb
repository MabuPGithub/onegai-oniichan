class AdminsController < ApplicationController

    before_action :authenticate_admin!
    def index
        @users = User.all.order(id: :desc)
    end

    def show
        @user = User.find(params[:id])
        @user_orders = Order.where('user_id =?', @user.id).order(id: :asc)
    end
    
    def new

    end

    def create
        @nendo = Nendoroid.new(nendoroid_params)
        
        if @nendo.save
            
            redirect_to "/admins"
        else
            render :new
        end
    end

    def update
        @nendo = Nendoroid.find(params[:id])
        if @nendo.update(nendoroid_params)
            redirect_to "/availability-status"
        else
            render "/availability-status"
        end
    end

    def transaction_status
        @orders = Order.where('status =?', 'not paid').order(id: :desc)
        @users = User.all
    end

    def orders
        @orders = Order.all.order(id: :desc)
        @users = User.all
    end

    def availability_status
        @nendos = Nendoroid.all.order(nendoroid_number: :desc)
    end

    private
    def nendoroid_params
        params.require(:nendoroid).permit(:id, :name, :nendoroid_number, :series, 
                                        :simple_description, :description, :price, 
                                        :release_date, :pre_order_price, :pre_order_date, 
                                        :eta, :min_deposit, :availability, :main_photo, photos: [])
    end
end