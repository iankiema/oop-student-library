require_relative '../student'
require_relative '../classroom'

RSpec.describe Student do
  it 'creates a new student' do
    classroom = Classroom.new('A101')
    student = Student.new(name: 'Alice', age: 18, parent_permission: true, classroom:classroom)
    expect(student.name).to eq('Alice')
    expect(student.age).to eq(18)
    expect(student.parent_permission).to be_truthy
    expect(student.classroom).to eq(classroom)
  end
end
