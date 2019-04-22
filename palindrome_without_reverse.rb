# write a method to determine whether a string
# is a palindrome without using the reverse method

# Algo,
# Create a reversed_string
# => start with empty string, iterate through chars
# => adding each to the front of the string with unshift
# Compare string and reversed_string
def reverse_string(string)
  reversed_string = []
  string.each_char { |char| reversed_string.unshift(char)}
  reversed_string.join
end

def palindrome?(string)
  string == reverse_string(string)
end

p palindrome?('racecar')
p palindrome?('anagram')