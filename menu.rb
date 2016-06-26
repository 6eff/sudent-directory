require_relative 'directory.rb'
@students = []
def print_menu
  # 1. print menu
  puts "1. Input sudents"
  puts "2. Print students"
  puts "3. Save students to a csv file"
  puts "4. Load students list from csv file"
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
  # 2. ask for user input
  # 3. do what user asked
  case selection
  when "1"
  input_students
  when "2"
  show_students
  when "3"
    print_list_to_file
  when "4"
    load_students
  when "9"
    puts "Good buy!"
    exit #program terminates
  else
    puts "I don't understand, please repeat"
  end
end
def print_list_to_file
  file = File.open("students.csv", "w")
  @students.each do |student|
    students_data = [student[:name], student[:cohort], student[:hobby], student[:country], student[:height]]
    data_line = students_data.join(",")
    file.puts data_line
  end
  file.close
end
def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end
def try_load_students
  filename = ARGV.first# first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end
def interactive_menu
loop do
  print_menu
  process_selection(STDIN.gets.chomp)
end
end
try_load_students
interactive_menu
