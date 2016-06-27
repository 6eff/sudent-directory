# sudent-directory #
The student-directory script allows you to manage list of students enrolled at Villains Academy

## how to use ##
```shell
ruby menu.rb
```
@students =[]
def input_names
  puts "Please enter each student name and cohort in name/cohort format."
  puts "To finish, hit enter twice"
  names = STDIN.gets
  names.delete! "\n"
  names_cohort = names.split("/")
  while !names.empty? do
    while !["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december", nil].include?(names_cohort[1]) do
      puts "Misstype in cohort name"
      names = STDIN.gets.chomp
      names_cohort = names.split("/")
    end
      add_students(names_cohort[0], names_cohort[1])
      puts "You've entered #{@students.count} students"
      names = STDIN.gets.chomp
      names_cohort = names.split("/")
  end
  @students
end
def input_hobby_country_name(students)
  if students == []
    exit
  else
  puts "Please enter hobby for each of sutdents, hit enter after last one"
  index = 0
  puts "Let's start with #{students[0][:name]}, what's his hobby?"
  hobby = STDIN.gets.chomp
  until index == students.length   do
    while hobby == "" do
    puts "Please enter hobby or 'unknown'"
    hobby = STDIN.gets.chomp
    end
    students[index].store(:hobby, hobby)
    if index < students.length - 1
     puts "Let's enter #{students[index + 1][:name]}'s hobby"
   else
     break
    end
    hobby = STDIN.gets.chomp
    index += 1
  end
  puts "Please enter contry of birth for each student, hit enter after last one"
  puts "Let's start with #{students[0][:name]}, where he/she was born?"
  index = 0
  country = STDIN.gets.chomp
  until index == students.length do
    while country == "" do
      puts "Please enter country of birth, or 'unknown'"
      country = STDIN.gets.chomp
    end
    students[index].store(:country, country)
    if index < students.length - 1
    puts "Let's enter #{students[index + 1][:name]}'s country"
  else
    break
  end
    index += 1
    country = STDIN.gets.chomp
  end
  puts "Please enter height for each student, hit enter after last one"
  puts "Let's start with #{students[0][:name]}'s height"
  height = STDIN.gets.chomp
  index = 0
  until index == students.length do
    while height == "" do
      puts "Please enter height, or 'unknown'"
      height = STDIN.gets.chomp
    end
    students[index].store(:height, height)
    if index < students.length - 1
    puts "Let's enter #{students[index + 1][:name]}'s height"
  else
    break
  end
    index += 1
    height = STDIN.gets.chomp
  end
  students
end
end

def print_students(students)
  if students == []
  puts "List is empty, input students" and return
  else
  puts "Please enter the letter to only print the students whose name begins with that letter"
  puts "Only names shorter then 12 charcters will be printed out"
  letter = STDIN.gets.chomp.downcase
  puts "The students of The Villains Academy"
  puts "____________________________________"
  index = 0
  count = students.length
  students.sort_by!{|x| x[:cohort]}
  until index == count
    if students[index][:name].length < 12
      if  students[index][:name].start_with?(letter)
        string = "#{index+1}. #{students[index][:name]} (#{students[index][:cohort]} cohort)"
        puts string.center(string.length() +10)
      end
    end
    index +=1
  end
end
end
def print_footer(students)
  if students == []
    return
  else
  if students.count > 1
  puts "Overall we have #{students.count} great student"
  puts
else
  puts "Overall we have #{students.count} great students"
  puts
end
end
end
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
  puts "Please enter name of the file where data will be saved"
  filename = STDIN.gets.chomp + ".csv"
  file = File.open(filename, "w")
  @students.each do |student|
    students_data = [student[:name], student[:cohort], student[:hobby], student[:country], student[:height]]
    data_line = students_data.join(",")
    file.puts data_line
  end
  puts "Successfully saved data to #{filename}"
  puts
  file.close
end
def add_students(name, cohort)
  if cohort.nil?
    @students << {name: name, cohort: :november}
else
  @students << {name: name, cohort: cohort.to_sym}
end
end
def load_students(filename = nil)
  if filename.nil?
  puts "Choose file from the list, type and hit enter"
  puts "_____________________________________________"
  Dir.glob('/Users/julia/RUBY/test/student-directory/*.csv') do |file|
    puts File.basename(file).chomp('.csv')
  end
  filename = STDIN.gets.chomp + ".csv"
  while !File.exist?(filename)
  puts "Please check that you've entered correct file name"
  filename = STDIN.gets.chomp + ".csv"
  end
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    add_students(name, cohort)
  end
  puts "Successfully loaded #{@students.count} from #{filename}"
  file.close
else
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    add_students(name, cohort)
  end
  puts "Successfully loaded #{@students.count} from #{filename}"
  file.close
end
end
def try_load_students
  filename = ARGV.first# first argument from the command line
    # load_students and return if filename.nil? # get out of the method if it isn't given
if filename.nil?
   return
else
    if File.exists?(filename + ".csv") # if it exists
      load_students(filename + ".csv")
    else # if it doesn't exist
      puts "Sorry, #{filename} doesn't exist."
      exit # quit the program
    end
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
