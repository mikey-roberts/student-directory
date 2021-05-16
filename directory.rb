def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
students = []
name = gets.chomp
cohort = gets.chomp
cohort = "november" if cohort.empty?
while !name.empty? do
  students << {name: name, cohort: cohort.to_sym, hobbies: :hobbies}
  puts "Now we have #{students.count} students"
  name = gets.chomp
  cohort = gets.chomp
  cohort = "november" if cohort.empty?
  end
students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def sort_cohort(students)
  students.sort_by! {|student| student[:cohort]}
end

def print(students)
  students.each {|cohort| puts "#{cohort[:name]} who is in the #{cohort[:cohort]} cohort"}
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
sort_cohort(students)
print(students)
print_footer(students)