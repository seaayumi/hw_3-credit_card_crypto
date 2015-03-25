#implementation found @ http://stackoverflow.com/questions/9188360/implementing-the-luhn-algorithm-in-ruby
#    nums_a = number.to_s.chars.map(&:to_i)

def credit_card_valid?(account_number)
  #stringnum = "79927398713"
  #nums_a = stringnum.to_s.chars.map(&:to_i) # SS start code

  digits = account_number.scan(/./).map(&:to_i)
  check = digits.pop

  sum = digits.reverse.each_slice(2).map do |x, y|
    [(x * 2).divmod(10), y || 0]
  end.flatten.inject(:+)

  (10 - sum % 10) == check
end

puts credit_card_valid?("79927398713")
puts credit_card_valid?("79927398716")