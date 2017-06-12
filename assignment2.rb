puts "enter the string"
input_string = gets.chomp
input_string.gsub!(/\D/,' ')
puts input_string
numbers = input_string.split(" ")
sum = 0
count = 0
numbers.each do |x|
  if x.to_i>0
    sum += x.to_i
    count += 1
  end
end
  average = sum/count
  puts average
