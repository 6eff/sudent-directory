students = ["Dr. Hannibal Lector", "Darth Vader", "Nurse Ratched", "Michael Corleone", "Alex DeLarge", "The Wicked Witch of the West", "Terminator", "Fredie Krueger", "The Joker", "Joffrey Baratheon", "Norman Bates"]

def print_header
  puts "The students of The Villains Academy"
  puts "____________________________________"
  puts
end

def print_students(names)
  names.each {|name| puts name}
puts
end

def print_footer(names)
puts "Overall we have #{names.count} great students"
puts
end

print_header
print_students(students)
print_footer(students)
