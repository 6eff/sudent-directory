def input_names
  puts "Please enter each student name"
  puts "To finish, hit enter twice"
  students = []
  names = gets.chomp
  names_cohort = names.split("/")
  h = {:name => names_cohort[0], :cohort => names_cohort[1] || :november}

  while !names.empty? do
    students << {name: h[:name], cohort: h[:cohort]}
    puts "You've entered #{students.count} students"
    names = gets.chomp
  end
  students
end
def input_hobby_country_name(students)
  puts "Please enter hobby for each of sutdents"
  index = 0
  puts "Let's start with #{students[0][:name]}, what's his hobby?"
  hobby = gets.chomp
  until index == students.length - 1 do
    while hobby == "" do
      puts "Please enter hobby, or 'unknown'"
      hobby = gets.chomp
    end
    students[index].store(:hobby, hobby)
    puts "Let's enter #{students[index + 1][:name]}'s hobby"
    index += 1
    hobby = gets.chomp
    while hobby == "" do
      puts "Please enter hobby, or 'unknown'"
      hobby = gets.chomp
    end
  end
  puts "Please enter contry of birth for each student"
  puts "Let's start with #{students[0][:name]}, where he/she was born?"
  index = 0
  country = gets.chomp
  until index == students.length - 1 do
    while country == "" do
      puts "Please enter country of birth, or 'unknown'"
      country = gets.chomp
    end
    students[index].store(:country, country)
    puts "Let's enter #{students[index + 1][:name]}'s country"
    index += 1
    country = gets.chomp
    while country == "" do
      puts "Please enter country of birth, or 'unknown'"
      country = gets.chomp
    end
  end
  puts "Please enter height for each student"
  puts "Let's start with #{students[0][:name]}'s height"
  height = gets.chomp
  index = 0
  until index == students.length - 1 do
    while height == "" do
      puts "Please enter height, or 'unknown'"
      height = gets.chomp
    end
    students[index].store(:height, height)
    puts "Let's enter #{students[index + 1][:name]}'s height"
    index += 1
    height = gets.chomp
    while height == "" do
      puts "Please enter height, or 'unknown'"
      height = gets.chomp
    end
  end
  p students
end

# def print_header
#   puts "The students of The Villains Academy"
#   puts "____________________________________"
#   puts
# end

def print_students(students)
  puts "Please enter the letter to only print the students whose name begins with that letter"
  puts "Only names shorter then 12 charcters will be printed out"
  letter = gets.chomp.downcase
  puts "The students of The Villains Academy"
  puts "____________________________________"
  index = 0
  count = students.length
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


def print_footer(students)
  puts "Overall we have #{students.count} great students"
  puts
end
students = input_names
input_hobby_country_name(students)
print_students(students)
print_footer(students)
