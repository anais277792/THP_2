class UsersController < ApplicationController
    def create

    end

    def new

    end

    def show
        @user = User.find(params[:id])#user_id
    end
    
    def edit 

    end 

    def update

    end 

    def destroy

    end
end
