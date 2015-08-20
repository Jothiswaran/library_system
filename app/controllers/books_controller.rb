class BooksController < ApplicationController

def bookshome
end

def addbooks
  @book=Book.new
end

def destroy
  Book.find(params[:id]).destroy
  redirect_to searchbooks_path
end

def create
  params[:book][:available]=true
  @book = Book.new(params[:book])
  if @book.save
    redirect_to bookshome_path
  else
    render 'addbooks'
  end
end

def searchbooks
  @book = Book.findBook(false)
end
  
def bookname
  if params[:button1]
    @searchresults = Book.searchAuthor(params[:search])
  else
    @searchresults = Book.searchBook(params[:search])
  end
end

def allbooks
  @book=Book.findBook(true)
end


end