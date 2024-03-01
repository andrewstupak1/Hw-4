class PlacesController < ApplicationController

    def index
      @places = Place.where({ "user_id" => @current_user["id"] })
    end
  
    def show
      @place = Place.find_by({ "id" => params["id"] })
      if @place
        @entries = Entry.where({ "place_id" => @place["id"], "user_id" => session["user_id"] })
      else
        redirect_to "/places", notice: "Place not found."
      end
    end

  def new
  end

def create
  @place = Place.new
  @place["name"] = params["name"]
  @place["user_id"] = @current_user["id"]
  if @place.save
    redirect_to "/places", notice: "Place was successfully created."
  else
    render :new
  end
end
end

