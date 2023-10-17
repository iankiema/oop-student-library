require_relative '../person'

describe Person do
  let(:person) { described_class.new }

  describe '#initialize' do
    it 'has a generated id' do
      expect(person.id).to be_a(Integer)
    end

    it 'has a default name' do
      expect(person.name).to eq('Unknown')
    end

    it 'has a default age of 0' do
      expect(person.age).to eq(0)
    end

    it 'has an empty list of rentals' do
      expect(person.rentals).to be_empty
    end
  end

  describe '#can_use_services?' do
    context 'when the person is of age' do
      it 'returns true' do
        person.age = 25
        expect(person.can_use_services?).to be_truthy
      end
    end

    context 'when the person is under age' do
      it 'returns true if parent permission is granted' do
        person.age = 15
        person.instance_variable_set(:@parent_permission, true)
        expect(person.can_use_services?).to be_truthy
      end

      it 'returns false if parent permission is not granted' do
        person.age = 15
        person.instance_variable_set(:@parent_permission, false)
        expect(person.can_use_services?).to be_falsy
      end
    end
  end

  describe '#add_rental' do
    it 'adds a rental to the list' do
      rental = double('Rental')
      person.add_rental(rental)
      expect(person.rentals).to include(rental)
    end
  end

  describe '#correct_name' do
    it 'returns the correct name' do
      person.name = 'John Doe'
      expect(person.correct_name).to eq('John Doe')
    end
  end
end
