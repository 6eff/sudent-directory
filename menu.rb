require_relative 'directory.rb'
@students = []
def print_menu
  # 1. print menu
  puts "1. Input sudents"
  puts "2. Print students"
  puts "9. Exit" # will add some more
end
def input_students
  # input students
  @students = input_names
  input_hobby_country_name(@students)
end
def show_students
  # show students
  print_students(@students)
  print_footer(@students)
end
def process_selection(selection)
loop do
  print_menu
  # 2. ask for user input
  selection = gets.chomp
  # 3. do what user asked
  case selection
  when "1"
  input_students
  when "2"
  show_students
  when "9"
    puts "Good buy!"
    exit #program terminates
  else
    puts "I don't understand, please repeat"
  end
end
end
def interactive_menu
  print_menu
  process_selection(gets.chomp)
end
interactive_menu
