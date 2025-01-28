require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'Validations' do
    it "is valid with a title, author, price, and published_date" do
      book = Book.new(title: "Valid Title", author: "John Doe", price: 9.99, published_date: '2023-01-01')
      expect(book).to be_valid
    end

    it "is not valid without a title" do
      book = Book.new(title: nil, author: "John Doe", price: 9.99, published_date: '2023-01-01')
      expect(book).not_to be_valid
    end

    it "is not valid without an author" do
      book = Book.new(title: "Valid Title", author: nil, price: 9.99, published_date: '2023-01-01')
      expect(book).not_to be_valid
    end

    it "is not valid without a price" do
      book = Book.new(title: "Valid Title", author: "John Doe", price: nil, published_date: '2023-01-01')
      expect(book).not_to be_valid
    end

    it "is not valid without a published date" do
      book = Book.new(title: "Valid Title", author: "John Doe", price: 9.99, published_date: nil)
      expect(book).not_to be_valid
    end
  end
end