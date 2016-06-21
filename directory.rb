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
def print_header
  puts "The students of The Villains Academy"
  puts "____________________________________"
  puts
end

def print_students(students)
  students.each {|entry| puts "#{entry[:name]} (#{entry[:cohort]} cohort)"}
puts
end

def print_footer(students)
puts "Overall we have #{students.count} great students"
puts
end

students = input_names
print_header
print_students(students)
print_footer(students)
