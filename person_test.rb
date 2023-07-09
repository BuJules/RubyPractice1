require "test/unit"
require_relative "person"

class PersonTest < Test::Unit::TestCase

    def setup
        @person = Person.new("Kornelii", "Morarash", "OK6987453214", "31-10-1999")
    end

     ['Anna', 'Maria', 'Anna-Maria'].each do |name|
    define_method("test_valid_first_name_#{name}") do
      assert_equal(name, @person.first_name, "Name #{name} is valid name")
    end
  end

  ['An-', 'Anna-', '', '-', '12345'].each do |name|
    define_method("test_invalid_first_name_#{name}") do
      assert_raise { @person.first_name = name }
    end
  end

  ['Anna', 'Maria', 'Anna-Maria'].each do |name|
    define_method("test_valid_last_name_#{name}") do
      assert_equal(name, @person.last_name, "Name #{name} is valid name")
    end
  end

  ['An-', 'Anna-', '', '-', '12345'].each do |name|
    define_method("test_invalid_last_name_#{name}") do
      assert_raise { @person.last_name = name }
    end
  end

    ['AA5847693258'].each do |inn|
    define_method("test_valid_inn_ = \"#{inn}\"") do
        @person.inn = inn
        assert_equal(inn, @person.inn, "inn #{inn} is valid")
      end
    end

    ['AЯ6787787654', '', ' ', 'az1234567898', '5676567656AZ', 'AZ78987'].each do |inn|
    define_method("test_invalid_inn_ = \"#{inn}\"") do
        assert_raise { @person.inn = inn }
      end
    end

    ['15-05-2005'].each do |birth_date|
    define_method("test_valid_birth_date_ = \"#{birth_date}\"") do
        @person.birth_date = birth_date
        assert_equal(birth_date, @person.birth_date, "Birth date #{birth_date} is valid")
      end
    end

    [' ', '', '-', '15082008', '10-11-2024'].each do |birth_date|
    define_method("test_invalid_birth_date_ = \"#{birth_date}\"") do
        assert_raise { @person.birth_date = birth_date }
      end
    end
end