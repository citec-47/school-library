require_relative 'book'
require_relative 'teacher'
require_relative 'student'
require_relative 'rentals'

class App
  def initialize
    @books = []
    # @teacher = []
    # @student = []
    @people = []
    @rental = []
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    option = gets.chomp
    case option
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Invalid option'
      create_person
    end
    puts 'Person created succesfully'
  end

  def create_student
    print 'Age: '
    student_age = gets.chomp
    print 'Name: '
    student_name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp
    is_permitted = case parent_permission.downcase
                   when 'y'
                     true
                   when 'n'
                     false
                   else
                     puts 'It\'s a yes or no type thing!. c\'mon now! '
                   end
    student = Student.new(student_age, student_name, is_permitted)
    @people.push(student)
  end

  def create_teacher
    print 'Age: '
    teacher_age = gets.chomp
    print 'Name: '
    teacher_name = gets.chomp
    print 'Specialization: '
    teacher_specialization = gets.chomp
    teacher = Teacher.new(teacher_age, teacher_name, teacher_specialization)
    @people.push(teacher)
  end

  def list_people
    if @people.empty?
      puts 'Must a person first'
    else
      @people.each { |person| puts "#{[person.class]} Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    end
  end

  def create_book
    print 'Title: '
    book_title = gets.chomp
    print 'Author: '
    book_author = gets.chomp
    book = Book.new(book_title, book_author)
    @books.push(book)
    puts 'Book created successfully'
  end

  def list_books
    if @books.empty?
      puts 'There is no book yet'
    else
      @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
  end

  def create_rental
    if @books.size.positive? && @people.size.positive?
      puts 'Select a book from the following list by number'
      @books.each_with_index { |book, index| puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}" }
      id = gets.chomp.to_i
      puts 'Select a person from the following list by number (not id)'
      @people.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, #{person.age}"
      end
      person_id = gets.chomp.to_i
      puts 'Enter the date in this format yy/mm/dd: '
      date = gets.chomp
      person_rental = Rental.new(@books[id], @people[person_id], date)
      @rental.push(person_rental)
      puts 'Rental creared successfully'
    else
      puts 'There must be a person and some book for a rental to take place!'
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

  def display_options
    puts 'Please choose an option by entering a number'
    puts '1. List all books.'
    puts '2. List all people.'
    puts '3. Create a person.'
    puts '4. Create a book.'
    puts '5. Create a rental.'
    puts '6. List all rentals.'
    puts '7. Exit app'

    option_id = gets.chomp
    puts option_id
    run_app(option_id)
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
