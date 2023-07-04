require 'date'
require_relative "validation"

module ConsoleInput
  include Validation

  def get_input_name()
    input = nil
    until input && input.match?(/\A[A-Za-z\-]+\z/)
      print "Input your name : "
      input = gets.chomp
    end
    input
  end

  def get_input_inn()
    input = nil
    until input && input.match?(/\A[A-Z]{2}\d{10}\z/)
      print "Input your inn: (ex. AA0000000000)"
      input = gets.chomp
    end
    input
  end

  def get_input_date()
    input = nil
    until input && valid_date_format?(input)
      print "Input date in dd-mm-yyyy format: "
      input = gets.chomp
    end
    Date.parse(input)
  end


end
