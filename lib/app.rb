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

  def create_book
    print "Enter title: " 
    title = gets.chomp 
    print "Enter author: "
    author = gets.chomp
    @books << Book.new(title, author)
    puts "Book created successfully"
  end

  def create_rental 
    puts "Select a book from the following list by number"
    @books.each_with_index do |book, index| 
      puts "#{index} Title: \"#{book.title}\", Author: #{book.author}"
    end

    book_index = gets.chomp.to_i

    puts "\nSelect a person from the following list by number (not id)"
    @people.each_with_index do |person, index|
      puts "#{index} [#{person.class}] Name: #{person.name}, ID: #{person.id}, NIN: #{person.nin}"
    end 

    person_index = gets.chomp.to_i

    print "\nDate:"

    @rentals << Rental.new(date, @books[book_index], @people[person_index])
    puts 'Rental created successfully'
  end

  def list_rentals_for_person_id 
    puts "Id of person: "
    id = gets.chomp.to_i

    rentals = @rentals.filter { |rental| rental.person.id == id }

    puts "Rentals: "
    rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
    end 
  end

  private 

  def create_student(nin, full_name)
    print "Is authorized? [Y/N]"
    authorized = gets.chomp 
    authorized = authorized.downcase == "y"
    Student.new(nin, full_name, authorized)
  end

  def create_teacher(nin, full_name) 
    print "Please enter course: " 
    course = gets.chomp
    Teacher.new(nin, full_name, course)
  end
end 
