class CitiesController < ApplicationController
    def create
    end

    def show
        @city = City.find(params[:id])
        @gossips = []
        @city.users.each do |user|)
           user.gossips.each do |gossip|
            @gossips << gossip
           
        end
    end

end
