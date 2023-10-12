class Rental
  attr_reader :date, :book

  def initialize(date, book)
    @date = date
    @book = book
  end
end
