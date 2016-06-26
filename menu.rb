require_relative 'directory.rb'
def interactive_menu
  students = []
loop do
  # 1. print menu
  puts "1. Input sudents"
  puts "2. Print students"
  puts "9. Exit" # will add some more
  # 2. ask for user input
  selection = gets.chomp
  # 3. do what user asked
  case selection
  when "1"
    # input students
    students = input_names
    input_hobby_country_name(students)
  when "2"
    # show students
    print_students(students)
    print_footer(students)
  when "9"
    puts "Good buy!"
    exit #program terminates
  else
    puts "I don't understand, please repeat"
  end
end
end
interactive_menu
