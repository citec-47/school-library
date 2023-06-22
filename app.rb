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
  end

  def list_all_books(_books)
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
      puts ' '
    end
  end

  def list_all_people(_people)
    @people.each do |person|
      print "[#{person.class}] name: #{person.name}, ID: #{person.id}, #{person.age}"
      puts ' '
    end
  end

  def create_stedent
    print 'Age:'
    age = gets.chomp
    print 'name:'
    name = gets.chomp
    print 'Has parent permission? [Y/N]:'
    permit = gets.chomp
    case permit
    when 'Y', 'y'
      permission = true
    when 'N', 'n'
      permission = false
    end
    student = Student.new(age, name, parent_permission: permission)
    @people.push(student)
    puts 'Person successfully created'
  end

  def create_teacher
    print 'Age:'
    age = gets.chomp
    print 'name:'
    name = gets.chomp
    print 'specialization:'
    specialization = gets.chomp
    teacher = Teacher.new(specialization, age, name)
    @people.push(teacher)
    puts 'Person created successfully'
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher(2)? [Input the number]'
    response = gets.chomp
    case response
    when '1'
      create_stedent
    when '2'
      create_teacher
    end
  end

  def create_book
    print 'Title:'
    title = gets.chomp
    print 'Author:'
    author = gets.chomp

    book = Book.new(title, author)
    @books.push(book)
    puts 'book created successfully'
  end

  def create_rental(_books, _people)
    puts 'Select a book from the following list of numbers'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}: "
    end
    bk_index = gets.chomp.to_i

    puts 'Select a person from the following list of numbers'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name},  ID: #{person.id}, Age: #{person.age}: "
    end
    pr_index = gets.chomp.to_i

    print 'Date:'
    get_date = gets.chomp

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
end
