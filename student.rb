require_relative 'person'

class Student < Person
  attr_accessor :name, :classroom

  def initialize(name: 'Unknown', age: 0, parent_permission: true)
    super(name: name, age: age, parent_permission: parent_permission)
  end
end
