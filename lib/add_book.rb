class AddBook
  include LiteUseCase

  def call
    puts 'INVOKED #call'
    puts 'BOOK ADDED'
  end

  private

  def validate
    true
  end
end
