require 'date'
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
end

