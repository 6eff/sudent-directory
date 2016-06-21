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
p students
end
def print_header
  puts "The students of The Villains Academy"
  puts "____________________________________"
  puts
end

def print_students(students)
  puts "Please enter the letter to only print the students whose name begins with that letter"
  letter = gets.chomp.downcase
  students.each.with_index do |entry, i|
    if entry[:name].start_with?(letter)
    puts "#{i+1}. #{entry[:name]} (#{entry[:cohort]} cohort)"
  end
end
end

def print_footer(students)
puts "Overall we have #{students.count} great students"
puts
end

p students = input_names
print_header
print_students(students)
print_footer(students)
