class Band < ActiveRecord::Base

	attr_accessible :name 

	def self.invent_name 
		Faker::Name.first_name + " and the "+ Faker::Commerce.product_name
	end

end