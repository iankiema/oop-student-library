require_relative '../book'
require_relative '../rental'

RSpec.describe Book do
  describe '#add_rental' do
    let(:book) { Book.new('Title', 'Author') }
    let(:rental) { instance_double('Rental') }

    it 'adds a rental to the book' do
      expect do
        book.add_rental(rental)
      end.to change { book.rentals.count }.by(1)
    end

    it 'adds the correct rental to the book' do
      book.add_rental(rental)

      expect(book.rentals).to include(rental)
    end
  end
end
