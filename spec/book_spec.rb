require_relative '../book'

RSpec.describe Book do
  it 'creates a new book' do
    book = Book.new('Title', 'Author')
    expect(book.title).to eq('Title')
    expect(book.author).to eq('Author')
  end
end
