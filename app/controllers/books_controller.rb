class BooksController < ApplicationController
before_filter :authenticate

def bookshome
    @borrowed = Borrow.pendingreturn
    @usr =[]
    @borrowed.each do |temp|
      @usr << temp.user if(temp.user.library_id==current_user.library_id)
    end
    @usr.uniq!
    if params[:sentemail]
        Notifier.deliver_renewalmail(@usr) # sends the email
        redirect_to addbooks_path
    end
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
  params[:book][:library_id]=current_user.library_id
  @book = Book.new(params[:book])
  if @book.save
    flash[:notice] = "You have successfully added a book"
    redirect_to bookshome_path
  else
    render 'addbooks'
  end
end

def searchbooks
    @book = Book.findBook(current_user.library_id).available
end
  

def bookname
  if params[:button1] && params[:search]
    @searchresults = Book.searchAuthor(params[:search],current_user.library_id)
  elsif params[:button2] && params[:search]
    @searchresults = Book.searchBook(params[:search],current_user.library_id)
  else
     @searchresults = Book.find(:all)
  end
end  

def allbooks
  @book=Book.findBook(current_user.library_id)
end

end