class Book
  attr_accessor :title, :author
  attr_reader :person, :rental

  def initialize(title, author)
    @title = title
    @author = author
    @rental = []
  end
end
