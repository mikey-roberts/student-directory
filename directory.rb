@students = []

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"  
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
name = gets.strip
cohort = gets.strip
cohort = "november" if cohort.empty?
while !name.empty? do
  @students << {name: name, cohort: cohort.to_sym}
  @students.count == 1 ? puts("Now we have #{@students.count} student") : puts("Now we have #{@students.count} students")
  name = gets.strip
  cohort = gets.strip
  cohort = "november" if cohort.empty?
  end
end

def show_students
    sort_cohort
    print_header
    print_students_list
    print_footer
end

def sort_cohort
  @students.sort_by! {|student| student[:cohort]}
end


def print_header
  if @students.count > 0
  puts "The students of Villains Academy"
  puts "-------------"
  end
end

def print_students_list
  @students.each {|cohort| puts "#{cohort[:name]} who is in the #{cohort[:cohort]} cohort"}
end

def print_footer
return nil if @students.count == 0
@students.count == 1 ? puts("Overall, we have #{@students.count} great student") : puts("Overall, we have #{@students.count} great students")
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

interactive_menu