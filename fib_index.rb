# select the elements in the array whose indexs are fibonacci numbers


# define an is_fib?(num) method to return boolean
# do an array.select with is_fib? providing the returns
def is_fib?(num)
  first = 1
  second = 1
  until second > num do
    return true if second == num
    first, second = second, first + second
  end
  false
end

def fib_index_elements(array)
  array.select { |num| is_fib?(array.index(num))}
end

p fib_index_elements([10, 20, 30, 1, 4, 13, 16, 17, 19]) # == [20, 30, 1, 13, 19]
