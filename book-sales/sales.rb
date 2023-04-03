# frozen_string_literal: true

require "bundler/inline"

gemfile(true) do
  source "https://rubygems.org"

  git_source(:github) { |repo| "https://github.com/#{repo}.git" }

  gem "activerecord", "~> 7.0.0"
  gem "sqlite3"
  gem "faker"
end

require "faker"
require "active_record"

ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: "sales.db")

class Author < ActiveRecord::Base
  has_many :books
end

class Publisher < ActiveRecord::Base
  has_many :books
end

class Genre < ActiveRecord::Base
  has_many :books
end

class Bookshop < ActiveRecord::Base
  has_many :sales
end

class Book < ActiveRecord::Base
  belongs_to :author 
  belongs_to :publisher 
  belongs_to :genre
  has_many :sales
end

class Sale < ActiveRecord::Base
  belongs_to :book 
  belongs_to :bookshop
end

Sale.delete_all

date = Date.parse("1-1-2020")
puts "Start date: #{date}"

(365 * 20).times do 
  Book.all.each do |book|
    Bookshop.all.each do |bookshop|
      Sale.create!(
        sale_date: date,
        quantity: Faker::Number.number(digits: rand(1..3)),
        book_id: book.id,
        bookshop_id: bookshop.id
      )
    end
  end 

  date = date + 1
end

puts "End date: #{date}"
puts "[#{Sale.count}] records"
