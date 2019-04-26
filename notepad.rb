# notepad.rb


def solution(string)
  start = 0
  arr = []

  str = string.push('-') if str.size.odd?
  
  loop do
    arr << str[start,2]
    start += 2
    break if start >= str.size - 1
  end

  arr
end