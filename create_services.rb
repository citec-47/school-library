# rubocop:disable Layout/EndOfLine
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
# rubocop:enable Layout/EndOfLine

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

def create_book
  print 'Title: '
  book_title = gets.chomp
  print 'Author: '
  book_author = gets.chomp
  book = Book.new(book_title, book_author)
  @books.push(book)
  puts 'Book created successfully'
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
