class BorrowsController < ApplicationController

  def issue
    @borrow=Borrow.new(:borrow_date=>Date.today, :return_date => '', :returned =>false,
                  :user_id => current_user[:id], :book_id => params[:book_id]);
    if @borrow.save
      params[:id]=params[:book_id]
      Book.update(params[:id])
    end
  end

  def returnbooks
    returns = Borrow.returnbook(current_user[:id])
    rbooks = []
    returns.each do |temp|
        rbooks << temp[:book_id]
    end
    @returnbooks = Book.find(rbooks)
  end

  def returnlibrary
      b=Book.find(params[:book_id])
      b.available=true
      b.save
      b=Borrow.find_by_book_id(params[:book_id])
      b.return_date = Date.today
      b.returned = true
      b.save
  end
end
