# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


Book.create([
  { title: 'The Catcher in the Rye', author: 'J.D. Salinger', price: 9.99, published_date: '1951-07-16' },
  { title: 'To Kill a Mockingbird', author: 'Harper Lee', price: 14.99, published_date: '1960-07-11' },
  { title: '1984', author: 'George Orwell', price: 12.99, published_date: '1949-06-08' },
  { title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', price: 10.99, published_date: '1925-04-10' },
  { title: 'Pride and Prejudice', author: 'Jane Austen', price: 8.99, published_date: '1813-01-28' }
])