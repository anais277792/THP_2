class CommentsController < ApplicationController
    def create
        unless current_user
            flash[:danger] = "Please log in."
            redirect_to new_session_path
          else
            @comment = Comment.create(content:params[:content],user_id:user.id,gossip:......)
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
