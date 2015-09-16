class BorrowsController < ApplicationController
  before_filter :authenticate
  
  def issue
    @borrow=Borrow.new(:borrow_date=>Date.today, :return_date => '', :returned =>false,
                  :user_id => current_user[:id], :book_id => params[:book_id], :expected_return_date => Date.today+10);
    if @borrow.save
      params[:id]=params[:book_id]
      Book.update(params[:id])
    end
  end

  def returnbooks

    returns = Borrow.returnbook(current_user[:id])
    @returnbooks=[]
        returns.each do |temp|
       @returnbooks << temp
   end

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

  def renewlibrary
      b = Borrow.find_by_book_id(params[:book_id])
      b.expected_return_date = Date.today+10
      b.save
  end

  def historyuser
    @history = []
    Borrow.find(:all, :include => [:user, :book], :conditions => ['user_id = ?', current_user.id]).each do |temp|
      @history << temp
    end
  end

  def historyadmin
    @unreturned = []
    Borrow.find(:all, :include => [:user, :book]).each do |temp| 
      @unreturned << temp if (temp.user.library_id==current_user.library_id)
    end
  end

end