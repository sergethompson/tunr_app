require 'spec_helper'

describe MusiciansController do
	describe "Given a musician name" do
		before do
			@name = "Diana Ross"
		end
		describe "Starting on the new musician page" do
			before do
				visit new_musician_path
			end
			it "creates a musician from a form" do
				fill_in "name", with: @name
				click_button "submit"
				current_path.should == musicians_path
				page.should have_content(@name)
			end
		end
	end

	describe "Given a musician" do
		before do
			# Might wanna add Faker random names later .invent_name via Faker gem
			@musician = Musician.create(name: "Serge")
		end

		describe "when we visit the edit page" do
			before do
				visit edit_musician_path(@musician)
			end

			it "should show the musician in the form" do
				# We want to find the name Serge on the page "in a form?"
				find_field("name").value.should == @musician.name
			end
			describe "when we fill in form with new name" do
				before do
					fill_in "name" , with: "Richard" 
					find_field("name").value.should == "Richard"
					click_button "submit"
					@musician.reload
				end
				# it "should redirect to the show page" do
				# 	current_path.should == musician_path(@musician)
				# end
				it "should show the new name" do
					@musician.reload
					current_path.should == musician_path(@musician)
					page.should have_content(@musician.name)
				end
			end	
		end

		 describe "when we visit the index page" do
          before do
              visit musicians_path
          end
          describe "when we click the delete button" do
              before do
                  within "tr.musician_#{@musician.id}" do
                     click_button "DELETE"
                  end
              end
              it "should leave us on the index page" do
                 current_path.should == musicians_path
              end
              it "should no longer have that musician" do
                  page.should_not have_content(@musician.name)
              end
          end
      end

	end #Given a Musican

end #MusiciansController