def interactive_menu
  students = []
  loop do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" 
    selection = gets.chomp
    case selection
    when "1"
      students = input_students
    when "2"
      print_header(students)
      sort_cohort(students)
      print(students)
      print_footer(students)
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
    end
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
students = []
name = gets.strip
cohort = gets.strip
cohort = "november" if cohort.empty?
while !name.empty? do
  students << {name: name, cohort: cohort.to_sym, hobbies: :hobbies}
  students.count == 1 ? puts("Now we have #{students.count} student") : puts("Now we have #{students.count} students")
  name = gets.strip
  cohort = gets.strip
  cohort = "november" if cohort.empty?
  end
students
end

def print_header(students)
  if students.count > 0
  puts "The students of Villains Academy"
  puts "-------------"
  end
end

def sort_cohort(students)
  students.sort_by! {|student| student[:cohort]}
end

def print(students)
  students.each {|cohort| puts "#{cohort[:name]} who is in the #{cohort[:cohort]} cohort"}
end

def print_footer(students)
return nil if students.count == 0
students.count == 1 ? puts("Overall, we have #{students.count} great student") : puts("Overall, we have #{students.count} great students")
end

interactive_menu