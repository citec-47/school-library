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
