require './teacher'
require './student'
require './book'
require './rental'

class App 
  def initialize 
    @people = []
    @books = []
    @rentals = []
  end

  def list_books 
    @books.each do |book|
      puts "Title: \"#{book.title}\", Author: #{book.author}" 
    end
  end

  def list_people 
    @people.each do |person| 
      puts "[#{person.class}] Full Name: #{person.name}, ID: #{person.id}, NIN: #{person.nin}" 
    end
  end

  def create_person 
    print "Do you want to create a student (1) or a teacher (2)? [input the number]: " 
    person_type = gets.chomp 

    if person_type != "1" && person_type != "2" 
      puts "Invalid option. Please try again"
      return 
    end

    print "Enter NIN: "
    nin = gets.chomp 

    print "Full Name: " 
    full_name = gets.chomp 

    person = 
      if person_type == "1" 
        create_student(nin, full_name)
      elsif person_type == "2" 
        create_teacher(nin, full_name)
      end

      @people << person
      puts "Person created successfully"
  end

  private 

  def create_student(nin, full_name)
    print "Is authorized? [Y/N]"
    authorized = gets.chomp 
    authorized = authorized.downcase == "y"
    Student.new(nin, full_name, authorized)
  end

  def create_teacher(nin, full_name) 
    print "Plase enter course: " 
    course = gets.chomp
    Teacher.new(nin, full_name, course)
  end
end 
