require "test/unit"
require_relative "person"
require_relative "personRepository"

class PersonRepTest < Test::Unit::TestCase
    def setup
        @peopleTestRep = PersonRepository.new()
        @person1 = Person.new("Danik", "Korovitski", "CE9874563214", "24-03-1999")
        @person2 = Person.new("Sashka", "Dron", "KU7485963625", "11-07-2003")
        @person3 = Person.new("Andrey", "Suprovich", "AC3578951236", "22-04-2000")
    end

    def test_add
        @peopleTestRep.add(@person1)
        @peopleTestRep.add(@person2)
        @peopleTestRep.add(@person3)
        assert_equal(3, @peopleTestRep.people.length)
        assert_includes(@peopleTestRep.people, @person1)
        assert_includes(@peopleTestRep.people, @person2)
        assert_includes(@peopleTestRep.people, @person3)
    end

    def test_add_invalid
        invalid_person = Person.new("12hyd", "!!!!", "580123456789", "20040502")
        @peopleTestRep.add(invalid_person)
    end
  
   def test_get_by_inn
          person = @peopleTestRep.get_by_id("CE9874563214")
          assert_equal(@person1, person)
      end
  
  
    def test_delete_by_inn
        @peopleTestRep.delete_by_inn("AC3578951236")
        assert_equal(1, @peopleTestRep.people.length)
        assert_not_includes(@peopleTestRep.people, @person3)
    end

     def test_get_by_invalid_inn
        person = @peopleTestRep.get_by_inn("GH5847693258")
        assert_nil(person)
    end
  
    def test_get_all
        all_people = @peopleTestRep.get
        assert_equal(3, all_people.length)
        assert_includes(all_people, @person1)
        assert_includes(all_people, @person2)
        assert_includes(all_people, @person3)
    end

   
end