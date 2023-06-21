class Rental
  attr_accessor :date, :person, :book

  def initialize(person, book, date)
    @person = person
    @book = book
    @date = date
    person.rentals << self
    book.rentals << self
  end
end
