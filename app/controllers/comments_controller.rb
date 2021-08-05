class CommentsController < ApplicationController
    def create
        unless current_user
            flash[:danger] = "Please log in."
            redirect_to new_session_path
          else
            redirect_to root_path
          end
    end
    
    def new
    end

    def update
    end

    def index

    end

    def destroy 
    end 
    
    def show
    end 

end
