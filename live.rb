
# Find the highest scoring word in a string
# Return first highest scoring word as a string


# Algorithm
# Split string into an array 'words'
# Create an empty array to recieve word scores
# Iterate over words, create a score variable
# and then iterate over each word's characters.
# Add the value of each character to score for that word
# Add that word's score to the scores_arr

# Find the index of the highest scoring word,
# Return words at that index.

SCORES = ('a'..'z').zip(1..26).to_h

def high(string)
  words = string.split
  scores_arr = []

  words.each do |word|
    score = 0
    word.chars.each do |char|
      score += SCORES[char]
    end
    scores_arr << score
  end

  words[scores_arr.index(scores_arr.max)]
end

p high('man i need a taxi up to ubud') == 'taxi'
p high('what time are we climbing up the volcano') == 'volcano'
p high('take me to semynak') == 'semynak'
p high('aa b') == 'aa'

def array_diff(array_1, array_2)
  array_1 - array_2
end

def array_diff(array_1, array_2)
  array_2.each do |num|
    array_1.delete(num)
  end
  array_1
end

def array_diff(array_1, array_2)
  count = 0
  loop do
    array_1.delete(array_2[count])
    count += 1
    break if count >= array_2.size
  end
  array_1
end

p array_diff([1,2], [1]) == [2]
p array_diff([1,2,2], [1]) == [2,2]
p array_diff([1,2,2], [2]) == [1]
p array_diff([1,2,2], []) == [1,2,2]
p array_diff([], [1,2]) == []


# Jordan's Idea

# def high(str)
#   letters = {}
#   counter = 1

#   ('a'..'z').each do |letter|
#     letters[letter] = counter
#     counter += 1
#   end

#   previous_word_score, current_word_score = 0, 0
#   highest_word = ''

#   str.split.each do |word|
#     word.each_char { |char| current_word_score += letters[char] }

#     if current_word_score > previous_word_score
#       highest_word = word 
#       previous_word_score = current_word_score
#       current_word_score = 0
#     else
#       current_word_score = 0
#     end

#   end

#   highest_word
# end
