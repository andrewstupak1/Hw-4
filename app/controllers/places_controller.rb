class PlacesController < ApplicationController

    def index
      @place = current_user.places 
    end
  
    def show
      @place = current_user.places.find_by(id: params[:id])
      if @place
        @entries = Entry.where(place_id: @place.id)
      else
        redirect_to places_path, alert: "Place not found."
      end
    end

  def new
  end

  def create
    @place = current_user.places.new(place_params) # This automatically sets the user_id for the place
    if @place.save
      redirect_to "/places", notice: "Place was successfully created."
    else
      render :new
    end
  end
end
  #above taken from chat gpt

