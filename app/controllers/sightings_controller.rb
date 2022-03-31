class SightingsController < ApplicationController


  def index 
    @sightings = Sighting.all

  end

  def search
    
    @sightings = Sighting.where("region LIKE ?", "%" + params[:q] + "%")

  end 

  def searchrange
    start_date = format_date_string('start_date')
    end_date = format_date_string('end_date')
   
    # @sightings = Sighting.where(date: Date.today - 2.days..Date.today)
    @sightings = Sighting.where(date: start_date..end_date)
  end 

  def searchform
    
  end 

  def new 
    @animal = Animal.find(params[:animal_id])
    @sighting = Sighting.new

  end

  def create
    
    @animal = Animal.find(params[:animal_id])
    @sighting = @animal.sightings.create(sighting_params)
    redirect_to animal_path(@animal)
  end

  def destroy
    @animal = Animal.find(params[:animal_id])
    @sighting = @animal.sightings.find(params[:id])
    @sighting.destroy
    redirect_to animal_path(@animal)
  end
 
  private
    def sighting_params
      params.require(:sighting).permit(:date, :latitude, :longitude, :region)
    end

    def format_date_string(date)
      DateTime.parse(params[:sightings]["#{date}(1i)"] + '-' + params[:sightings]["#{date}(2i)"] + '-' + params[:sightings]["#{date}(3i)"] + ' ' + params[:sightings]["#{date}(4i)"] + ":" + params[:sightings]["#{date}(5i)"])
    end
end