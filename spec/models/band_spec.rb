require 'spec_helper'

describe Band do 
	describe '.invent_name' do 
		before do 
			@name = Band.invent_name
		end

		it "generated a valid name " do 
			@name.should match /.* and the .*/
		end

	end
end
