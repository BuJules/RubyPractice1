require_relative "validation"
require_relative "console_input"

class Person
  include Validation
  include ConsoleInput

  attr_accessor :first_name, :last_name, :inn, :birth_date

  def initialize(first_name, last_name, inn, birth_date)
    @first_name = first_name
    @last_name = last_name
    @inn = inn
    @birth_date = birth_date
  end

  def first_name=(new_first_name)
    if valid_name?(new_first_name)
      @first_name = new_first_name
    else
      raise ArgumentError, "Invalid First Name"
    end
  end

  def last_name=(new_last_name)
    if valid_name?(new_last_name)
      @last_name = new_last_name
    else
      raise ArgumentError, "Invalid Last Name"
    end
  end

  def inn=(new_inn)
    if valid_inn?(new_inn)
      @inn = new_inn
    else
      raise ArgumentError, "Invalid INN"
    end
  end

  def birth_date=(new_birth_date)
    if valid_date_format?(new_birth_date)

      if after_date?(new_birth_date)
        @birth_date = new_birth_date
      else
        raise ArgumentError, "Invalid Birth Date"
      end
    else
      raise ArgumentError, "Invalid Date Format"
    end
  end

end
