require 'rails_helper'

RSpec.describe "Books", type: :request do
  describe "POST /books" do
    it "creates a book with author, price, and published date and shows a flash notice" do
      post books_path, params: { book: {
        title: "New Book",
        author: "John Doe",
        price: 19.99,
        published_date: '2023-01-01'
      } }

      expect(response).to redirect_to(book_path(Book.last))
      follow_redirect!
      expect(response.body).to include("Book was successfully created.")
      expect(response.body).to include("New Book")
      expect(response.body).to include("John Doe")
      expect(response.body).to include("19.99")
      expect(response.body).to include("2023-01-01")
    end

    it "shows a flash alert when title is blank" do
      post books_path, params: { book: {
        title: "",
        author: "John Doe",
        price: 19.99,
        published_date: '2023-01-01'
      } }

      expect(response.body).to include("Error with creating the book")
    end

    it "shows a flash alert when author is blank" do
      post books_path, params: { book: {
        title: "New Book",
        author: "",
        price: 19.99,
        published_date: '2023-01-01'
      } }

      expect(response.body).to include("Error with creating the book")
    end

    it "shows a flash alert when price is blank" do
      post books_path, params: { book: {
        title: "New Book",
        author: "John Doe",
        price: nil,
        published_date: '2023-01-01'
      } }

      expect(response.body).to include("Error with creating the book")
    end

    it "shows a flash alert when published date is blank" do
      post books_path, params: { book: {
        title: "New Book",
        author: "John Doe",
        price: 19.99,
        published_date: nil
      } }

      expect(response.body).to include("Error with creating the book")
    end
  end
end
