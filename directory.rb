def input_names
  puts "Please enter each student name and cohort in name/cohort format."
  puts "To finish, hit enter twice"
  students = []
  names = STDIN.gets
  names.delete! "\n"
  # while names == ""
  #   puts "Enter at least one student"
  #   names = STDIN.STDIN.gets.chomp
  # end
  names_cohort = names.split("/")
  while !names.empty? do
    while !["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december", nil].include?(names_cohort[1]) do
      puts "Misstype in cohort name"
      names = STDIN.gets.chomp
      names_cohort = names.split("/")
    end
      h = {:name => names_cohort[0], :cohort => names_cohort[1] || :november}
      students << {name: h[:name], cohort: h[:cohort].downcase.to_sym}
      puts "You've entered #{students.count} students"
      names = STDIN.gets.chomp
      names_cohort = names.split("/")
  end
  students
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
