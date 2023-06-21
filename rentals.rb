require_relative 'person'
require_relative 'book'

class Rentals
  attr_accessor :date
  attr_reader :person, :book

  def initialize(date, person, book)
    @date = date

    @person = person
    person.rentals << self

    @book = book
    book.rentals << self
  end
end
