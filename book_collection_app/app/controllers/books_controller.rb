class BooksController < ApplicationController
    
    def index
        @books = Book.all
    end

    def show
        @book = Book.find(params[:id])
    end

    def new
        @book = Book.new
    end

    def create
        @book = Book.new(book_params)
        if @book.save
            flash[:notice] = "Book was successfully created."
            redirect_to book_path(@book)
        else
            # the new action is not being called here, just re-rendering the view template again
            flash[:alert] = "Error with creating the book"
            render('new')
        end
    end

    def edit
        @book = Book.find(params[:id])
    end

    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
            flash[:notice] = "Book was successfully updated."
            redirect_to book_path(@book)
        else
            flash[:alert] = "Error with updating the book"
            render('edit')
        end
    end

    def delete
        @book = Book.find(params[:id])
    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        flash[:notice] = "Book was successfully deleted."
        redirect_to books_path
    end

    private

    def book_params
        params.require(:book).permit(
            :title
        )
    end

end
