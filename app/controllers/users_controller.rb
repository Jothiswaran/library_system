class UsersController < ApplicationController
  before_filter :authenticate , :only => [:edit, :update, :show, :index]
  before_filter :correct_user, :only => [:edit, :update]
  # GET /users
  # GET /users.xml
  def index
    @title = "All users"
    @users = User.findAll(current_user.library_id)
  end

  #def search
  #  @usrs = User.tire.search params[:q]
  #  render :action => "index1"
  #end
  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])
    @title = @user.name
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new
    @title = "Sign up"
    @libraries=Library.findLibrary
  end

  # GET /users/1/edit
  def edit
    @title = "Edit user"
  end

  # POST /users
  # POST /users.xml
  def create
      @user = User.new(params[:user]) 
      if @user.save
        Notifier.deliver_signup_notification(@user) # sends the email
        flash[:notice] = "An email has been sent to you indicating successfull signup"
        sign_in @user
        redirect_to @user
      else
        @title = "Sign up"
        render 'new' 
      end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = "Profile updated."
      redirect_to @user 
    else
      @title = "Edit user"
      render 'edit' 
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end

  private
  

  def correct_user
    @user = User.find(params[:id]) 
    redirect_to(root_path) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin? 
  end 

end
