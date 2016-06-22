  def input_names
    puts "Please enter each student name"
    puts "To finish, hit enter twice"
    students = []
    names = gets.chomp
    while !names.empty? do
      students << {name: names, cohort: :november}
      puts "You've entered #{students.count} students"
      names = gets.chomp
    end
  students
  end
def input_hobby_country_name(students)
puts "Please enter hobby for yeach of sutdents"
index = 0
puts "Let's start with #{students[0][:name]}, what's his hobby?"
hobby = gets.chomp
until index == students.length - 1 do
  students[index].store("hobby", hobby)
puts "Let's enter #{students[index + 1][:name]} 's hobby"
index += 1
hobby = gets.chomp
end
students
end

  def print_header
    puts "The students of The Villains Academy"
    puts "____________________________________"
    puts
  end

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
       puts "#{index+1}. #{students[index][:name]} (#{students[index][:cohort]} cohort)"
  end
  end
  index +=1
    end

  end


  def print_footer(students)
  puts "Overall we have #{students.count} great students"
  puts
  end
  print_header
  students = input_names
input_hobby_country_name(students)
  print_students(students)
  print_footer(students)
