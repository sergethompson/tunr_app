class MusiciansController < ApplicationController
	def new
		@musician = Musician.new
	end

	def create
		name = params[:name] || params[:musician][:name]
		Musician.create(name: name)
		redirect_to musicians_path
	end

	def index
		@musicians = Musician.all 
	end

	def edit
		@musician = Musician.find(params[:id])
	end

	def show
		@musician = Musician.find(params[:id])
	end

	 def update
  	musician = Musician.find(params[:id])
  	musician.name = params[:name]
  	musician.save
    redirect_to musician_path(musician)
  end

  def destroy
  	Musician.delete(params[:id])
  	redirect_to musicians_path
  end

end