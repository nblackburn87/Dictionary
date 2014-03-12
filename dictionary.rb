require './lib/Term'

def main_menu
  puts "Press 'a' to add a new dictionary entry."
  puts "Press 's' to search entries already in the dictionary."
  puts "Press 'e' to edit a dictionary entry."
  puts "Press 'd' to remove a word from the dictionary."
  puts "Press 'l' to list all available entries."
  puts "Press 'x' to leave."

  menu_choice = gets.chomp

  case menu_choice
  when 'a'
    add_term
  when 's'
    search_term
  when 'e'
    edit_term
  when 'd'
    delete_term
  when 'l'
    list_terms
  when 'x'
    puts 'Thank you!'
  else
    puts "Please choose again.\n"
    main_menu
  end
end

def add_term
  puts "Please enter a new word for the dictionary:"
  new_word = gets.chomp
  puts "Please enter the definition for #{new_word}:"
  new_definition = gets.chomp
  new_term = Term.create(new_word, new_definition)
  main_menu
end

#search only works with word as a property. Multi-language support currently breaks search
# def search_term
#   puts "Please enter the word you'd like to search for:"
#   user_input = gets.chomp
#   found_term = Term.search(user_input)
#   puts "Returned entry:"
#   puts "#{found_term[0].word}: #{found_term[0].definitions}"
#   puts "\n"
#   main_menu
# end

def edit_term
  puts "Would you like to add(1) a new definition, change an existing one(2), or return to the main menu(3)?"
  user_input = gets.chomp.to_i
  if user_input == 1
    Term.all.each_with_index do |term, index|
      puts "#{index + 1}. #{term.word}"
    end
    puts "Enter the number of the word you'd like to give a new definition."
    user_input = gets.chomp.to_i
    current_term = Term.all[user_input - 1]
    puts "Add the definition for #{current_term.word}:"
    new_definition = gets.chomp
    current_term.add_definition(new_definition)
    puts "New definition added to #{current_term.word}."
    puts "\n"
    edit_term

  elsif user_input == 2
    Term.all.each_with_index do |term, index|
      puts "#{index + 1}. #{term.word}"
    end
      puts "Enter the number of the term you'd like to edit."
      user_input = gets.chomp.to_i
      current_term = Term.all[user_input - 1]
      current_term.definitions.each_with_index do |definition, index|
        puts "#{index + 1}. #{definition}"
      end
      puts "Enter the number of the definition you'd like to edit"
      definition_choice = gets.chomp.to_i
      puts "Update the definition for #{current_term.definitions[definition_choice - 1]}:"
      updated_definition = gets.chomp
      current_term.definitions[definition_choice - 1] = updated_definition
      puts "#{current_term.word} updated.\n"
      puts "\n"
    main_menu
  elsif user_input == 3
    main_menu
  else
    puts "Please enter either 1 or 2."
    edit_term
  end
end

def delete_term
  Term.all.each_with_index do |term, index|
    puts "#{index + 1}. #{term.word}: #{term.definitions}"
  end
    puts "Enter the number of the term you'd like to delete."
    user_input = gets.chomp.to_i
    delete = Term.all.delete_at(user_input - 1)
    puts "\n\n#{delete.word} removed from your dictionary.\n"
  main_menu
end

def list_terms
  Term.all.each do |term|
    puts "#{term.word}: #{term.definitions.to_s}"
  end
  puts "\n"
  main_menu
end

main_menu
