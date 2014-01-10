class BandsController < ApplicationController

	def new
		@band = Band.new
	end

	def create
		Band.create(name: params[:band][:name])
		redirect_to bands_path
	end
  
  def index
  	@bands = Band.all
  end

  def show 
  	@band = Band.find(params[:id])
  end

  def edit 
  	@band = Band.find(params[:id])
  end

  def update
  	band = Band.find(params[:id])
  	band.name = params[:band][:name]
  	band.save
    redirect_to band_path(band)
  end

  def destroy
  	Band.delete(params[:id])
    redirect_to bands_path
  end

end