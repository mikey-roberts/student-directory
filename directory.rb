@students = []

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
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
  when "4"
    load_students
  when "9"
    puts "You have exited the program"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def save_details(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def student_count
  "Now we have #{@students.count} student"
end

def input_students
  puts "You have chosen to enter student details"
  puts "Please enter the names of the students you would like to add"
  puts "To finish, just hit return twice"
name = STDIN.gets.strip
while !name.empty? do
cohort = STDIN.gets.strip
cohort = "november" if cohort.empty?
  save_details(name, cohort)
  if @students.count == 1
    puts student_count
  else 
    puts "#{student_count}s"
  end
  name = STDIN.gets.strip
  end
end

def show_students
    puts "You have selected to display the list of students"
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
  puts "The student list has been saved"
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  puts "Student list successfully loaded"
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
  save_details(name, cohort)
  end
  file.close
end

def try_load_students(filename = "students.csv")
  filename = ARGV.first 
  return if filename.nil? 
  if File.exists?(filename) 
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else 
    puts "Sorry, #{filename} doesn't exist."
    exit 
  end
end

try_load_students("students.csv")
interactive_menu