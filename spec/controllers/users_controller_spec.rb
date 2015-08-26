require 'spec_helper' 

describe UsersController do
	integrate_views
	describe "GET 'new'" do
		it "should be successful" do
		get 'new'
		response.should be_success 
		end
	end

	describe "GET 'show'" do
		before(:each) do
			@user = Factory(:user)
			User.stub!(:find, @user.id).and_return(@user)
		end
		
	#	it "should be successful" do 
	#		get :show, :id => @user 
	#		response.should be_success
	#	end 
	end

	describe "POST 'create'" do
		describe "failure" do
			before(:each) do
				@attr = { :name => "", :email => "", :password => "",
                  :password_confirmation => "" }
		        @user = Factory.build(:user, @attr)
		        User.stub!(:new).and_return(@user)
				@user.should_receive(:save).and_return(false) 
			end
		end

		it "should render the 'new' page" do 
			post :create, :user => @attr 
			response.should render_template('new')
		end

		#describe "success" do
		#	before(:each) do
		#		@attr = { :name => "New User", :email => "user@example.com",
         #         :password => "foobar", :password_confirmation => "foobar" }
		  #      @user = Factory.build(:user, @attr)
	    
	    #	    User.stub!(:new).and_return(@user)
		#		@user.should_receive(:save).and_return(true) 
		#	end

#			it "should redirect to the user show page" do 
#				post :create, :user => @attr
#				response.should redirect_to(user_path(@user))
#			end 
#		end

	end
end