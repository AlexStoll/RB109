# Algorithm
# Split string to words
# words[0] = num_1, words[1] = operator, words[2] = num_2

# Just a start, figure out a solution for chains of operations

WORD_TO_NUM = {'zero' => 0, 'one' => 1,'two' => 2,'three' => 3,'four' => 4,
               'five' => 5,'six' => 6,'seven' => 7,'eight' => 8,'nine' => 9,
               '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, 
               '6' => 6, '7' => 7, '8' => 8, '9' => 9
              }
def str_calc(string)
  words = string.split(' ')
  num_1, operator, num_2 = words[0], words[1], words[2]
 
  num_1, num_2 = WORD_TO_NUM[num_1], WORD_TO_NUM[num_2]
  case operator
  when 'plus'
    num_1 + num_2
  when 'minus'
    num_1 - num_2
  end
end





p str_calc("two plus two")
p str_calc("seven minus six")
p str_calc("zero plus 8")