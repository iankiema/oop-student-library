require_relative '../rental'
require_relative '../book'
require_relative '../person'

RSpec.describe Rental do
  it 'creates a new rental' do
    book = Book.new('Title','Author')
    person = Person.new(name: 'John', age:25)
    date = Time.now
    rental = Rental.new(date, book, person)
    expect(rental.date).to eq(date)
    expect(rental.book).to eq(book)
    expect(rental.person).to eq(person)
  end
end
