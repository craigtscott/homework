require 'byebug'
def sum_to(n)
  if n == 1
    1
  elsif n < 1
    nil
  else
    n + sum_to(n-1)
  end
end

def add_numbers(arr = 0)
  if arr == 0
    nil
  # debugger
  elsif arr.length == 1
    arr.pop
  else
    arr.last + add_numbers(arr.slice(0...-1))
  end
end

def gamma_fnc(n)
  if n == 0
    nil
  elsif n == 1
    1
  else
     gamma_fnc(n-1) * ( n-1 )
  end

end




# Test Cases    Γ(n) = (n-1)!
p gamma_fnc(0)  # => returns nil
p gamma_fnc(1)  # => returns 1
p gamma_fnc(4)  # => returns 6
p gamma_fnc(8)  # => returns 5040


# # Test Cases
# p  add_numbers([1,2,3,4]) # => returns 10
# p  add_numbers([3]) # => returns 3
# p  add_numbers([-80,34,7]) # => returns -39
# p  add_numbers() # => returns nil
#

# # Test Cases
# p  sum_to(5)  # => returns 15
# p  sum_to(1)  # => returns 1
# p  sum_to(9)  # => returns 45
# p  sum_to(-8)  # => returns nil
