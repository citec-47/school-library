require_relative 'book'
require_relative 'teacher'
require_relative 'student'
require_relative 'rental'
require_relative 'show'
require_relative 'services'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_people
    if @people.empty?
      puts 'Please create a person by choosing option 3.'
    else
      @people.each { |person| puts "#{person.class} Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    end
  end

  def list_books
    if @books.empty?
      puts 'Please create a book by choosing option 4.'
    else
      @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
  end

  def rental_list
    if @rentals.empty?
      puts 'None of the books have been rented yet. Please come back later.'
    else
      print 'Enter the person ID you want to get the rental for: '
      person_id = gets.chomp.to_i
      list_rental(person_id)
    end
  end

  def list_rental(person_id)
    person_rentals = @rentals.select { |rental| rental.person.id == person_id }
    if person_rentals.length.positive?
      person_rentals.each do |rental|
        puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
      end
    else
      puts 'The selected person has no rentals.'
    end
  end

  def exit_app
    puts 'Thank you for using this app! We really do appreciate your support 🙏.'
    exit
  end

  def run_app(option_id)
    case option_id
    when '1'
      list_books
    when '2'
      list_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      rental_list
    when '7'
      exit_app
    else
      puts 'Choose an existing option!'
    end
    display_options
  end

  def display_options
    puts '-----------------------'
    puts 'Please select an option:'
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List rentals for a person'
    puts '7. Exit'
    print 'Enter the option number: '
    option_id = gets.chomp
    run_app(option_id)
  end

  def initial
    puts 'Welcome to the School Library App!'
    display_options
  end
end

app = App.new
app.initial
