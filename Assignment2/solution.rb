
# Example 1:

def get_addresses
  User.includes(:address).joins(address: :city).map(&:address)
end


# Example 2:
class Greeting
  attr_accessor :name
end


# Example 3:
def sum(*args)
  args.inject(:+)
end

sum(2, 3) #=> 5
sum(1,2,3,4) # => 10
