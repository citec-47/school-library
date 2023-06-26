require_relative 'book'
require_relative 'teacher'
require_relative 'student'
require_relative 'rental'
require_relative 'display'
require_relative 'create_services'

class App
  def initialize
    @books = []
    @people = []
    @rental = []
  end

  def list_people
    if @people.empty?
      puts 'Must a person first'
    else
      @people.each { |person| puts "#{[person.class]} Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    end
  end

  def list_books
    if @books.empty?
      puts 'There is no book yet'
    else
      @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
  end

  def rental_list
    if @rental.empty?
      puts 'Rentals doesn\'t exist yet! come back later'
    else
      print 'Enter the person_id you wanna get the rental for: '
      person_id = gets.chomp.to_i
      list_rental(person_id)
    end
  end

  def list_rental(person_id)
    person_rentals = @rental.select { |rental| rental.person.id == person_id }
    if person_rentals.length.positive?
      person_rentals.each do |rental|
        puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
      end
    else
      puts 'The selected person has no rentals'
    end
  end

  def exit_app
    puts 'Thank you for using this app! '
    exit
  end

  # rubocop:disable Metrics/CyclomaticComplexity
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
      puts 'Choose an existing option!..'
    end
    display_options
  end
  # rubocop:enable Metrics/CyclomaticComplexity

  def initial
    puts 'Welcome to School Library App!'
    display_options
  end
end
