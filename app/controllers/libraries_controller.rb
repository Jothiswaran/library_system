class LibrariesController < ApplicationController

	def new
		@library = Library.new
    render :partial => "new"
	end

	def create
      @library = Library.new(params[:library]) 
      if @library.save
        redirect_to books_path
      else
        redirect_to books_path
      end
  end
  def show
    @rslt=Library.search(params[:book][:search])
  end
end