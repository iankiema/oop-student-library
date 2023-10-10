require_relative 'person'
require_relative 'classroom'
require_relative 'student'
require_relative 'book'
require_relative 'rental'
require 'date'

classroom = Classroom.new('A101')
student = Student.new(classroom:classroom, name: "John Doe")
book = Book.new("Ruby Programming", "John Smith")
person = Person.new(name:"alice")

rental = Rental.new(Date.today, book, person)

puts "#{student.name} is in Classroom #{student.classroom.label}"
puts "#{book.title} has been rented by #{person.name} on #{rental.date}"
