require_relative '../rental'
require_relative '../book'
require_relative '../person'

RSpec.describe Rental do
  describe '#initialize' do
    let(:date) { Time.now }
    let(:book) { instance_double('Book', add_rental: nil) }
    let(:person) { instance_double('Person', add_rental: nil) }

    it 'creates a rental with a date, book, and person' do
      rental = Rental.new(date, book, person)

      expect(rental.date).to eq(date)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
    end

    it 'adds the rental to the book' do
      Rental.new(date, book, person)

      expect(book).to have_received(:add_rental).with(kind_of(Rental)).once
    end

    it 'adds the rental to the person' do
      Rental.new(date, book, person)

      expect(person).to have_received(:add_rental).with(kind_of(Rental)).once
    end
  end
end
