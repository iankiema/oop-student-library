require_relative '../teacher'
require_relative '../specialization'

RSpec.describe Teacher do
  it 'creates a new teacher with specialization' do
    specialization = Specialization.new('Math')
    teacher = Teacher.new(name: 'Mr. Smith', age: 35, specialization: specialization)
    expect(teacher.name).to eq('Mr. Smith')
    expect(teacher.age).to eq(35)
    expect(teacher.specialization).to eq(specialization)
  end
end
