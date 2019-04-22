=begin
TAKE A TEN MINUTE WALK

You live in the city of Cartesia where all roads are laid out in a perfect grid.
You arrived ten minutes too early to an appointment, so you decided to take the
opportunity to go for a short walk. The city provides its citizens with a Walk
Generating App on their phones -- everytime you press the button it sends you an
 array of one-letter strings representing directions to walk (eg. ['n', 's', 'w', 'e']).
You always walk only a single block in a direction and you know it takes you one minute
to traverse one city block, so create a function that will return true if the 
walk the app gives you will take you exactly ten minutes (you don't want to be 
early or late!) and will, of course, return you to your starting point. 
Return false otherwise.

Note: you will always receive a valid array containing a random assortment of 
direction letters ('n', 's', 'e', or 'w' only). It will never give you an empty
 array (that's not a walk, that's standing still!).
=end
=begin
def ten_minute_walk?(array)
  return false if array.size != 10

  array.count('w') == array.count('e') && 
  array.count('n') == array.count('s')
end

ten_minute_walk?(['n', 's', 'e', 'w', 'n', 's', 'e', 'w', 's', 'n']) == true

=begin
FIND THE UNIQUE NUMBER -
There is an array with some numbers. All numbers are equal except for one. Try to find it!

find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55
It’s guaranteed that array contains more than 3 numbers.


def find_uniqq(array) # Nicest and simplest way to write.
  array.each {|x| return x if array.count(x) == 1}
end

def find_uniq(array) # At least 10x faster than previous example.
  element = 0
  array.each do |x|
    element = array[0]
    return x if x != element || (array[0] != array[1]) && (array[0] != array[2])
    element == x
  end
end

find_uniq([0,1,1,1,1])
find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55
=end
=begin

# FIND THE UNIQUE STRING

There is an array of strings. All strings contains similar letters except one. Try to find it!

findUniq([ 'Aa', 'aaa', 'aaaaa', 'BbBb', 'Aaaa', 'AaAaAa', 'a' ]) === 'BbBb'
findUniq([ 'abc', 'acb', 'bac', 'foo', 'bca', 'cab', 'cba' ]) === 'foo'
Strings may contain spaces. Spaces is not significant, only non-spaces symbols matters.
E.g. string that contains only spaces is like empty string.

It’s guaranteed that array contains more than 3 strings.

=end

def find_unique(array)
  # use map to sort all strings
  # (convert strings to array of chars, then sort, then join back)
  # so 'BaBa' or 'aaBB' will both be 'BBaa'
  options = array.map do |string|
    string.downcase.chars.uniq.sort.join.delete(' ')
  end
  options.each_with_index do |item, idx|
    return array[idx] if options.count(item) == 1
  end
end

p find_unique([ 'Aa', 'aaa', 'aaaaa', 'BbBb', 'Aaaa', 'AaAaAa', 'a' ]) == "BbBb"
p find_unique([ 'abc', 'acb', 'bac', 'foo', 'bca', 'cab', 'cba' ]) == 'foo'
p find_unique([ 'silvia', 'vasili', 'victor' ]) == 'victor'
p find_unique([ 'Tom Marvolo Riddle', 'I am Lord Voldemort', 'Harry Potter']) == 'Harry Potter'

=begin
Delete >n occurences of an element.
Given a list 'array' and a number N, create
a new list that contains each number of
'array' at most N times without reordering.

delete_nth ([1,1,1,1],2) == [1,1]
delete_nth([20,37,20,21],1) == [20,37,21]
delete_nth([1, 2, 3, 1, 2, 3, 1, 9, 9], 2) == [1, 2, 3, 1, 2, 3, 9, 9]


=end

# How to keep the first occurences and just delete the later ones?
# notes
# name parameters descriptively
# 



# My solution:
=begin
def delete_nth(array, limit)
  result = []
  counter_hash = Hash.new(0)
  array.each do |x|
    counter_hash[x] += 1
    result << x if (counter_hash[x] <= limit)
  end
  result
end


def delete_nth(array, limit)
  result = []
  array.each_with_index do |num, index|
    result << num unless array[0..index].count(num) > limit
  end
  result
end

p delete_nth([1, 2, 2, 3, 3, 3, 5, 1], 2)
=end

=begin
# Nicer solution:
def delete_nth(array, limit)
  occurences = Hash.new(0)
  array.reject { |x| (occurences[x] += 1) > limit }
end

delete_nth([1,1,1,1],2) # return [1,1]
delete_nth([20,37,20,21],1) # return [20,37,21]
=end

=begin
Unique in Order

Implement the function unique_in_order which takes as 
argument a sequence and returns a list of items without
 any elements with the same value next to each other 
 and preserving the original order of elements.

 each through the thing, adding each value to the hash as a key and adding 1 to its value
 if the count is < 2, add the element to the resultant array
=end


=begin
def unique_in_order(thing)
  if thing.class == String
    thing.squeeze.chars
  elsif thing.class == Array && thing[0].class == Integer
    string = ''
    thing.each { |num| string << num.to_s}
    string.squeeze.chars.map(&:to_i)
  elsif thing.class == Array && thing[0].class == String
    string = ''
    thing.each { |letter| string << letter}
    string.squeeze.chars
  end
end

p unique_in_order('AAAABBBCCDAABBB') == ['A','B','C','D','A','B']
p unique_in_order([1, 2, 3, 4, 1, 2, 2]) == [1, 2, 3, 4, 1, 2]
p unique_in_order(['A', 'B', 'B']) == ["A", "B"]
=end

=begin
# Write a function that will return the dupes of distinct case-insensitive alphabetic characters and numeric digits that occur more than once in the input string.
#   The input string can be assumed to contain only alphabets (both uppercase and lowercase) and numeric digits.
#
# Test Cases:
# dupes("abcde") == 0 # no characters repeats more than once
# dupes("aabbcde") == 2 # 'a' and 'b'
# dupes("aabBcde") == 2 # 'a' occurs twice and 'b' twice (`b` and `B`)
# dupes("indivisibility") == 1 # 'i' occurs six times
# dupes("Indivisibilities") == 2 # 'i' occurs seven times and 's' occurs twice
# dupes("aA11") == 2 # 'a' and '1'
# dupes("ABBA") == 2 # 'A' and 'B' each occur twice

def dupes(string)
  output = 0
  counts = Hash.new(0)
  string.chars.each do |char|
    counts[char] += 1
  end
  counts.each do |letter, count|
    output += 1 if count > 1
  end
  output
end

ALPHA_NUM = ('a'..'z').to_a + %w(1 2 3 4 5 6 7 8 9)

def dupes(str)
  str.downcase!
  dupes = 0
  hash_dupes = {}

  ALPHA_NUM.each do |alpha_num|
    count = str.count(alpha_num)
    if count > 1
      dupes += 1
      hash_dupes[alpha_num] = count
    end
  end

  hash_dupes
  dupes
end
=end

=begin
# Given 2 strings, your job is to find out if there is a substring that appears in both strings. You will return true if you find a substring that appears in both strings, or false if you do not.
# We only care about substrings that are longer than one letter long.

# Input two strings
# Output true/false
# Check if substring > 2 chars long occurs
# in both strings - case insensitive

# Algorithm
# downcase the strings
# GET ALL TWO CHARACTER SUBSTRINGS
# [a, b, c] return [a, b] and [b, c]

# compare two lists, to see if any overlap exists
# 
def get_substrings(string)
  substrings = []
  chars = string.downcase.chars
  chars.each_with_index do |char, index|
    substrings << "#{char}#{chars[index + 1]}"
  end
  substrings.select {|sub| sub.size > 1}
end

def substring_test(string_1, string_2)
  subs_1 = get_substrings(string_1)
  subs_2 = get_substrings(string_2)

  subs_1.each { |sub_1| return true if subs_2.include?(sub_1) }
  false
end
=end

# Notes from meeting
# variables initialized in outer scope visible in inner scope
# variables initialized in inner scope not visible in outer scope
# _____________________________________________________________-

# Simple transposition is a basic and simple cryptography technique.
# We make 2 rows and put first a letter in the Row 1, the second in
# the Row 2, third in Row 1 and so on until the end. 
# Then we put the text from Row 2 next to the Row 1 text and thats it.
# Complete the function that recieves a string and encrypt it with 
# this simple transposition.

# Example
# For example if the text to encrypt is: "Simple text", the 2 rows will be:

# Row 1 S m l   e t
# Row 2 i p e t x 

# So the result string will be: `"Sml etipetx"`

# My solution

# def simple_transposition(text)
#   arr1, arr2 = text.chars.partition.with_index {|char, idx| idx.even?}
#   "#{arr1.join}#{arr2.join}"
# end

# _______________________________________________________________
# Description:

# In this kata you are required to, given a string, replace every letter with its position in the alphabet.
# If anything in the text isn't a letter, ignore it and don't return it.
# "a" = 1, "b" = 2, etc.
# Example
# alphabet_position("The sunset sets at twelve o' clock.")
# Should return "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11" (as a string)

# alphabet_position("The sunset sets at twelve o' clock.") == "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"


# My solution:

# def alphabet_position(string)
#   values = ('a'..'z').zip(1..26).to_h
#   string.delete('^A-Za-z').downcase.chars.map { |char| char = values[char] }.join(' ')
# end


# __________________________________________________________________
