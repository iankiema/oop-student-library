require_relative 'person'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'

person = Person.new(name: 'maximilianus', age: 25)
capitalized_person = CapitalizeDecorator.new(person)
trimmed_person = TrimmerDecorator.new(capitalized_person)

puts person.correct_name
puts capitalized_person.correct_name
puts trimmed_person.correct_name
