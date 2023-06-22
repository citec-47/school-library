require_relative 'app'
def others(option); end

# rubocop:disable Metrics/CyclomaticComplexity, Metrics/MethodLength

def main
  app = App.new
  books = []
  people = []
  rentals = []
  puts 'Welcome to School Library App!'
  option = nil
  while option != '7'
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    option = gets.chomp
    case option
    when '1'
      puts 'No books yet' if books.empty?
      app.list_all_books(books)
    when '2'
      if people.empty?
        puts 'No people yet'
        next
      end
      app.list_all_people(people)
    when '3'
      people.push(app.create_person)
    when '4'
      books.push(app.create_book)
    when '5'
      rentals.push(app.create_rental(books, people))
    when '6'
      app.list_rentals
    end
    puts
  end
  puts 'Thank you for using this app!'
end

# rubocop:enable Metrics/CyclomaticComplexity, Metrics/MethodLength

main
