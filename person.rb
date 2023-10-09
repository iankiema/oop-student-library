require_relative 'nameable'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(name: 'Unknown', age: 0, parent_permission: true)
    super()
    @id = generate_id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end

  def generate_id
    rand(1..1000)
  end
end

person = Person.new(name: 'maximilianus', age: 25)
capitalized_person = CapitalizeDecorator.new(person)
trimmed_person = TrimmerDecorator.new(capitalized_person)

puts person.correct_name
puts capitalized_person.correct_name
puts trimmed_person.correct_name
