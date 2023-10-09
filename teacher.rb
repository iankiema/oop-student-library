require_relative 'person'

class Teacher < Person
  def initialize(age, _classroom, name: 'Unknown', parent_permission: true)
    super(name, age, parent_permission)
    @classroom = specialization
  end

  def can_use_services?
    true
  end
end
