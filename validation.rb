require 'date'
require_relative "PersonRepository"

module Validation
  def self.valid_name?(string)
    return false if str.nil? || str.empty? ||str.length > 40
    return false unless string.match?(/\A[A-Za-z\-]+\z/)
    true
  end

  def self.valid_inn?(string)
    return false if inn.nil? || inn.empty? || string.length != 12
    return false unless string.match?(/\A[A-Z]{2}\d{10}\z/)
    true
  end

  def valid_date_format?(input)
    /^\d{2}-\d{2}-\d{4}$/.match?(input) && Date.parse(input)
  rescue ArgumentError
    false
  end

  def self.after_date?(date)
    return false if date.nil?
    date <= Date.today
  end

  def valid_unique_person?(person)
      existing_person = @people.find { |p| p.inn == person.inn }
      if existing_person
        return false
        existing_person = @people.find { |p| p.email == person.email }
      if existing_person
        return false
      else
        return true
      end

  def is_a_validemail?(email)
  (email =~ /^(([A-Za-z0-9].++)|([A-Za-z0-9]+-+)|([A-Za-z0-9]++)|([A-Za-z0-9]++))[A-Z‌​a-z0-9]+@{1}((\w+-+)|(\w+.))\w{1,63}.[a-zA-    Z]{2,4}$/i)
  end

    
end
