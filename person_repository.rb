require_relative "person"
require 'date'


class PersonRepository

  def initialize
    @people = []
  end

  def add_person(person)
    if person.is_a?(Person)
      @people << person
    else
      raise ArgumentError, "Person must be an instance of Person class"
    end
  end

  def show_people
    @people.each do |person|
      puts "First Name: #{person.first_name}, Last Name: #{person.last_name}, INN: #{person.inn}, Date Of Birth: #{person.birth_date}"
    end
  end

  def get_by_inn(inn)
    @people.find { |person| person.inn == inn }
  end

  def get_by_last_name(last_name)
    @people.find { |person| person.last_name == last_name }
  end
  
end
