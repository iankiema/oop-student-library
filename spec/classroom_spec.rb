require_relative '../classroom'

RSpec.describe Classroom do
  it 'creates a new classroom' do
    classroom = Classroom.new('A101')
    expect(classroom.label).to eq('A101')
  end
end
