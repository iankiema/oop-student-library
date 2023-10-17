require_relative '../classroom'

RSpec.describe Classroom do
  it 'creates a new classroom' do
    classroom = Classroom.new('A101')
    expect(classroom.label).to eq('A101')
  end

  it 'initializes an empty array of students' do
    classroom = Classroom.new('Room 101')
    expect(classroom.students).to be_an(Array)
    expect(classroom.students).to be_empty
  end
end

describe '#add_student' do
  it 'adds a student to the classroom' do
    classroom = Classroom.new('Room 101')
    student = instance_double('Student', classroom: nil, :classroom= => nil)

    classroom.add_student(student)

    expect(classroom.students).to include(student)
    expect(student).to have_received(:classroom=).with(classroom).once
  end
end
