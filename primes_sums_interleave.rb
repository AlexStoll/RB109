def prime?(num)
  (2..(num - 1)).each do |div|
    return false if num % div == 0
  end
  true
end

def prime_any?(num)
  !(2..(num - 1)).any? {|value| num % value == 0}
end

p prime?(10)
p prime?(13)

def sum_product_series(array, operator)
  case operator
  when '+' then array.inject(:+)
  when '*' then array.inject(:*)
  end
end
p sum_product_series([1, 2, 3, 4, 5, 6, 7], '+')
p sum_product_series([1, 2, 3, 4, 5, 6, 7], '*')

def interleave_arrays(array_1, array_2)
  result = []
  idx = 0
  until result.size == (array_1.size + array_2.size) do
    result << array_1[idx] if array_1[idx] != nil
    result << array_2[idx] if array_2[idx] != nil
    idx += 1
  end
  result
end

p interleave_arrays([1], [2, 4, 6, 8, 10, 12])



