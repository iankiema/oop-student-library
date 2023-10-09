require_relative 'person'

class Teacher < Person
  def initialize(specialization:, name: 'Unknown', age: 0)
    super(name: name, age: age, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
