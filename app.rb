require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rentals'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
    @classroom = []
  end

  def list_all_books
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
      puts ' '
    end
  end

  def list_all_people
    @people.each do |person|
      print "[#{person.class}] name: #{person.name}, ID: #{person.id}, #{person.age}"
      puts ' '
    end
  end

  def age
    print 'Age:'
    gets.chomp
  end

  def name
    print 'Name:'
    gets.chomp
  end

  def classroom
    puts 'Enter the classroom for the student:'
    gets.chomp
  end

  def permission
    puts 'Has parent permission? [Y/N]:'
    permit = gets.chomp
    case permit
    when 'Y', 'y'
      true
    when 'N', 'n'
      false
    end
  end

  def create_student
    student = Student.new(classroom, age, name, parent_permission: permission)
    @people.push(student)
    puts 'Person successfully created'
  end

  def specialization
    print 'Specialization:'
    gets.chomp
  end

  def create_teacher
    teacher = Teacher.new(specialization, age, name)
    @people.push(teacher)
    puts 'Person created successfully'
  end

  def person_type
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]'
    gets.chomp
  end

  def create_person
    response = person_type
    case response
    when '1'
      create_student
    when '2'
      create_teacher
    end
  end

  def title
    print 'Title:'
    gets.chomp
  end

  def author
    print 'Author:'
    gets.chomp
  end

  def create_book
    book = Book.new(title, author)
    @books.push(book)
    puts 'book created successfully'
  end

  def book_index
    puts 'Select a book from the following list of numbers'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}: "
    end
    gets.chomp.to_i
  end

  def person_index
    puts 'Select a person from the following list of numbers'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name},  ID: #{person.id}, Age: #{person.age}: "
    end
    gets.chomp.to_i
  end

  def rental_date
    print 'Date:'
    gets.chomp
  end

  def create_rental(_books, _people)
    bk_index = book_index
    pr_index = person_index
    get_date = rental_date
    rental = Rentals.new(get_date, @people[pr_index], @books[bk_index])
    @rentals.push(rental)
    puts 'Rental created successully'
  end

  def list_rentals
    puts 'ID of person:'
    pr_id = gets.chomp.to_i
    @rentals.each do |rent|
      if rent.person.id == pr_id
        puts "Date:#{rent.date}, Book #{rent.book.title} by #{rent.book.author} borrowed by #{rent.person.name}"
      end
    end
  end

  def functions(option)
    case option
    when '1'
      list_all_books
    when '2'
      list_all_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental(@books, @people)
    when '6'
      list_rentals
    end
    puts
  end
end
