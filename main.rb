require_relative 'app'

def ask_user
  puts 'Select what you want to do'
  puts "
    1 List all books.
    2 List all people.
    3 Create a person.
    4 Create a book.
    5 Create a rental.
    6 List all rentals for a given person id.
    7 Exit."
  gets.chomp.to_i
end

def loop_books(my_app)
  my_app.books.each_with_index do |book, index|
    puts "#{index + 1}) Title: #{book.title}, Author: #{book.author}"
  end
end

def loop_people(my_app)
  my_app.people.each_with_index do |person, index|
    type = person.is_a?(Student) ? 'Student' : 'Teacher'
    puts "#{index}) [#{type}] Name: #{person.name} ID: #{person.id} Age: #{person.age}"
  end
end

def process_choice(choice, my_app)
  case choice
  when 1
    loop_books(my_app)
  when 2
    loop_people(my_app)
  when 3
    my_app.create_person
  when 4
    my_app.create_book
  when 5
    my_app.create_rental
  when 6
    puts my_app.view_rental
  end
end

def main
  my_app = App.new
  loop do
    choice = ask_user
    break if choice == 7

    process_choice(choice, my_app)
  end
end

main
