class PlacesController < ApplicationController
  before_action :authenticate_user!

    def index
      @places = Place.where({ "user_id" => @current_user["id"] })
    end
  
    def show
      place = Place.find_by({ "id" => params["id"] })
           if @place
        @entries = Entry.where({ "place_id" => @place["id"], "user_id" => session["user_id"] })
        redirect_to :action => 'show', :entries => @entries
            else
        redirect_to places_path, alert: "Place not found."
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

