class PlacesController < ApplicationController

  class PlacesController < ApplicationController
    def index
      @places = current_user.places 
    end
  
    def show
      @place = current_user.places.find_by({ "id" => params["id"] })
      @entries = Entry.where({ "place_id" => @place["id"] })
    end

  def new
  end

  def create
    @place = Place.new
    @place["name"] = params["name"]
    @place.save
    redirect_to "/places"
  end
end
end

