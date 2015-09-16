class LibrariesController < ApplicationController

	def new
		@library = Library.new
	end

	def create
      @library = Library.new(params[:library]) 
      if @library.save
        flash[:notice] = "Library was added"
        redirect_to add_path
      else
        render 'new' 
      end
  end
  def show
      @libraries=Library.findLibrary
  end

end