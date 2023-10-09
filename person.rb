class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(name: 'Unknown', age: 0, parent_permission: true)
    @id = generate_id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end

  def generate_id
    rand(1..1000)
  end
end
