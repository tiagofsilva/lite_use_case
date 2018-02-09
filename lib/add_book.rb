class AddBook
  include LiteUseCase

  def call
    puts 'INVOKED #call'
    puts 'BOOK ADDED'
    puts result.inspect
  end

  private

  def validate
    false
  end
end
