require_relative 'person'
require_relative 'book'
require_relative 'rental'
require_relative 'teacher'
require_relative 'student'
require_relative 'classroom'
require_relative 'specialization'
require 'date'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
    @classrooms = []
    @specializations = []
  end

  def list_books
    puts 'List of Books:'
    @books.each { |book| puts "#{book.title} by #{book.author}"}
  end

  def list_people
    puts 'List of People:'
    @people.each {|person| puts "Name:#{person.name} ID: #{person.id}  Age:#{person.age}"}
  end

  def create_person
    puts "Chosse the type of person to create:"
    puts '1. Teacher'
    puts '2. Student'
    type_option = gets .chomp.to_i

    case type_option
    when 1
      create_teacher
    when 2
      create_student
    else
      puts 'Invalid option'
    end
  end


  def create_teacher
    puts 'Enter name for the teacher:'
    name = gets.chomp

    puts 'Enter age:'
    age = gets.chomp.to_i

    puts 'Does the teacher have parent permission? (Y/N)'
    parent_permission = gets.chomp.upcase == "Y"

    puts 'Enter Specialization:'
    specialization_label = gets.chomp

    specialization = find_or_create_specialization(specialization_label)

    teacher = Teacher.new(name: name, age: age, specialization: specialization, parent_permission: parent_permission)
    @people << teacher
    puts "Teacher #{name} created with ID #{teacher.id}"
  end

  def find_or_create_specialization(label)
    specialization = @specializations.find { |s| s.label == label}
    if specialization.nil?
      specialization = Specialization.new(label)
      @specializations << specialization
    end
    specialization
  end

  def create_student
    puts 'Enter age:'
    age = gets.chomp.to_i

    puts 'Enter name for the student:'
    name = gets.chomp

    puts 'Does the student have parent permission?(Y/N):'
    parent_permission = gets.chomp.upcase == 'Y'

    puts 'Enter classroom'
    classroom_label = gets.chomp

    classroom = find_or_create_classroom(classroom_label)

    student = Student.new(classroom: classroom, name: name, age: age, parent_permission: parent_permission)
    @people << student
    puts "Student #{name} created with ID #{student.id} successfully"
  end

  def find_or_create_classroom(label)
    classroom = @classrooms.find { |c| c.label == label}
    unless classroom
      classroom = Classroom.new(label)
      @classrooms << classroom
    end

    classroom
  end

  def create_book
    puts 'Enter title for the book:'
    title = gets.chomp
    puts 'Enter author for the book:'
    author = gets.chomp
    book = Book.new(title,author)
    @books << book
    puts "Book '#{title}' by #{author} created."
  end

  def create_rental
    puts 'Enter person ID for the rental:'
    person_id = gets.chomp.to_i

    puts 'Enter book title for the rental:'
    book_title = gets.chomp

    person = @people.find { |p| p.id == person_id}
    book = @books.find { |b| b.title == book_title}

    if person && book
      rental = Rental.new(Date.today, book, person)
      @rentals << rental
      puts "Rental created for #{person.name} (ID: #{person.id}) - #{book.title}"
    else
      puts 'Person or book not found'
    end
  end

  def list_rentals_for_person
    puts 'Enter person ID to list rentals:'
    person_id = gets.chomp.to_i

    person = @people.find { |p| p.id == person_id }

    if person
      puts "Rentals for #{person.name} (ID: #{person.id}):"
      person.rentals.each do |rental|
        puts "#{rental.book.title} - #{rental.date}"
      end
    else
      puts 'Person not found.'
    end
  end
end
