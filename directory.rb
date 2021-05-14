def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
students = []
name = gets.chomp
while !name.empty? do
  students << {name: name, cohort: :november, hobbies: :hobbies, country: :country_of_birth, height: :height}
  puts "Now we have #{students.count} students"
  name = gets.chomp
  end
students 
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  student_number = students.length
  idx = 0
  until idx == student_number 
  students.each_with_index do |students, value| 
  puts "#{value+1}. #{students[:name].center(20)}"
  idx += 1
  end
end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)