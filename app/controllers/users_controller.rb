class UsersController < ApplicationController
    def index

    end

    def show
      @user = User.find(params[:id])
    end
  
    def edit
      @user = User.find(params[:id])
    end
    
    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to "/admins"
      else
        render :edit
      end
    end
  
    def account
      
    end

    def nendoroids
      @nendos = Nendoroid.all
    end
    
    private
      def user_params
        params.require(:user).permit(:name, :email, :phone_number, :balance, :address)
      end
end