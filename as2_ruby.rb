
def exception(message)
  raise message
  rescue Exception => a
  puts a.message
end

def calculate_avg
puts "input string"
inp = gets.chomp
size = inp.size
#check for empty string
if size ==0
  message = "String is empty"
  exception(message)
  return
end
#loop to replace all the non integers in the string with " "
for i in 0...size do
  if !(inp[i].ord>=48 && inp[i].ord <=57)&&(inp[i] != "-")
    inp[i] = " "
  end
end
#extracting integers from the string
values = inp.split(" ")
#check for integers
if values.count==0
  message = "string has no integers"
  exception(message)
  return
end

sum = 0
count = 0
values.each do |i|
  if (i.to_i>0)
    sum += i.to_i
    count +=1
  end
end
#check for positive integers
if count ==0
  message = "no positive integers"
  exception(message)
  return
end

puts "number of positive integers in the given string are #{count}"
puts "The average of those positive integers  is #{sum.to_f/count}"
end
#Function call
calculate_avg
