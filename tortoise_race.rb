# tortoise 1 traveling at v1 ft/hr, v1_lead feet ahead
# tortoise 2 traveling at v2 ft/hr
# how long (hours, minutes, seconds) for tort2 to catch tort1


def race(v1, v2, g)
  return nil if v1 >= v2
  time_secs = (g.fdiv(v2 - v1) * 3600).to_i

  hours = time_secs / 3600
  minutes = (time_secs / 60) % 60
  seconds = time_secs % 60
  
  [hours, minutes, seconds]
end


p race(720, 850, 70)  == [0, 32, 18]
p race(80, 91, 37)# == [3, 21, 49]
p race(80, 100, 40) == [2, 0, 0]
