require_relative '../app'

RSpec.describe App do
  before(:each) do
    @app = App.new
  end

  describe '#create_teacher' do
    it 'creates a teacher' do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("30\n", "John\n", "Math\n")
      @app.create_teacher
      expect(@app.instance_variable_get(:@people).first).to be_a(Teacher)
    end
  end

  describe '#create_student' do
    it 'creates a student' do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("20\n", "Alice\n", "Y\n", "Math\n")
      @app.create_student
      expect(@app.instance_variable_get(:@people).first).to be_a(Student)
    end
  end

  describe '#find_or_create_specialization' do
    it 'creates a new specialization if not found' do
      specialization = @app.find_or_create_specialization('Physics')
      expect(specialization).to be_a(Specialization)
      expect(specialization.label).to eq('Physics')
    end

    it 'returns existing specialization if found' do
      existing_specialization = Specialization.new('Math')
      @app.instance_variable_get(:@specializations) << existing_specialization

      specialization = @app.find_or_create_specialization('Math')
      expect(specialization).to eq(existing_specialization)
    end
  end

  describe '#find_or_create_classroom' do
    it 'creates a new classroom if not found' do
      classroom = @app.find_or_create_classroom('Room 101')
      expect(classroom).to be_a(Classroom)
      expect(classroom.label).to eq('Room 101')
    end

    it 'returns existing classroom if found' do
      existing_classroom = Classroom.new('Room A')
      @app.instance_variable_get(:@classrooms) << existing_classroom

      classroom = @app.find_or_create_classroom('Room A')
      expect(classroom).to eq(existing_classroom)
    end
  end

  describe '#list_books_with_numbers' do
    it 'lists books with numbers' do
      book = instance_double(Book, title: 'The Great Gatsby', author: 'F. Scott Fitzgerald')
      @app.instance_variable_get(:@books) << book

      expect { @app.list_books_with_numbers }.to output("1. The Great Gatsby by F. Scott Fitzgerald\n").to_stdout
    end
  end

  describe '#list_people_with_numbers' do
    it 'lists people with numbers' do
      person = instance_double(Teacher, name: 'John', id: 1)
      @app.instance_variable_get(:@people) << person

      expect { @app.list_people_with_numbers }.to output("1. John (ID: 1)\n").to_stdout
    end
  end

end
