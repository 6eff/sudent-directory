students = [{name: "Dr. Hannibal Lector", cohort: :november}, {name: "Darth Vader",cohort: :november}, {name: "Nurse Ratched",cohort: :november}, {name: "Michael Corleone",cohort: :november}, {name: "Alex DeLarge",cohort: :november}, {name: "The Wicked Witch of the West",cohort: :november}, {name: "Terminator",cohort: :november}, {name: "Fredie Krueger",cohort: :november}, {name: "The Joker",cohort: :november}, {name: "Joffrey Baratheon",cohort: :november}, {name: "Norman Bates",cohort: :november}]
def print_header
  puts "The students of The Villains Academy"
  puts "____________________________________"
  puts
end

def print_students(names)
  names.each{|student| puts "#{student[:name]} (#{student[:cohort]} cohort)"}
puts
end

def print_footer(names)
puts "Overall we have #{names.count} great students"
puts
end

print_header
print_students(students)
print_footer(students)
