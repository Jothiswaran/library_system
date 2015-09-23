class LibrariesController < ApplicationController

	def new
		@library = Library.new
    render :partial => "new"
	end

	def create
      @library = Library.new(params[:library]) 
      if @library.save
        flash[:notice] = "Library was added"
        redirect_to books_path
      else
         redirect_to books_path
      end
  end
  def show
      @libraries=Library.findLibrary
      render :partial => "show"
  end

end