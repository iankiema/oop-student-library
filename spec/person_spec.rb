require_relative '../person'

RSpec.describe Person do
  it 'creates a new person' do
    person = Person.new(name: 'John', age: 25)
    expect(person.name).to eq('John')
    expect(person.age).to eq(25)
  end
end
