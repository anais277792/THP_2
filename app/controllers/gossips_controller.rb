class GossipsController < ApplicationController

    before_action :set_gossip, only: [:show, :edit, :update, :destroy]

    def index
        puts session[:user_id]
        # Méthode qui récupère tous les potins et les envoie à la view 
        #index (index.html.erb) pour affichage
        @gossip = Gossip.all 
    end
    
    def show
        # Méthode qui récupère le potin concerné et l'envoie à la 
        #view show (show.html.erb) pour affichage
        #@gossip = Gossip.find(params[:id])=> voir before_action
        @user = User.find(@gossip.user_id)
    end
    
    def new
      
        # Méthode qui crée un potin vide et l'envoie 
        #à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
        @gossip = Gossip.new
    end
    
    def create
        # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
        # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
         # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
         @gossip = Gossip.create(title:params[:title], content:params[:content], user:params[:user_id])
                @gossip.user = User.find_by(id: session[:user_id])
                if @gossip.save #on essaie de sauvegarder en base @gossip
                    # si ça marche, il redirige vers la page d'index du site
                    flash[:success] = "Potin bien créé !"
                    redirect_to gossip_path(@gossip.id)
                else
                # sinon, il render la view new (qui est celle sur laquelle on est déjà)
                    render :new
                end

    end
    
    def edit
        # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
        #@gossip = Gossip.find(params[:id])=> voir before_action

    end
    
    def update
        # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
        # pour info, le contenu de ce formulaire sera accessible dans le hash params
        # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
        #@gossip = Gossip.find(params[:id])=>before_action
        #gossip_params = params.require(:gossip).permit(:title, :content) comme on a fait une méthode :gossip_params 
        @gossip.update(gossip_params)
        redirect_to gossip_path
    end
    
    def destroy
        # Méthode qui récupère le potin concerné et le détruit en base
        # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
        @gossip.destroy(gossip_params)
        redirect_to root_path
    end

private 

def set_gossip
    @gossip = Gossip.find(params[:id])
end 

def gossip_params
    gossip_params = params.require(:gossip).permit(:title, :content, :user)
end
end
