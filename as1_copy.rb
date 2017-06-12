#start of Program
puts "enter the size of the grid"
$size = 5 # gets.chomp.to_i

#Initializing Array
$array = Array.new($size){Array.new($size,0)}

#sample Data
$array[0][0]=10
$array[1][1]=20
$array[2][2]=30
$array[3][3]=40
$array[4][4]=50

# Hash to find the index
$column_hash = {A: 0, B: 1, C: 2, D: 3, E: 4, F: 5, G: 6, H: 7, I:8, J:9}
$expression_hash = Hash.new
$dependent_hash = Hash.new
# Function to print the array
def print_array
  for i in 0..$size-1 do
    print "|"
    for j in 0..$size-1 do
      print "#{$array[i][j]} \t |"
    end
    print "\n"
  end
end
def set_dependency (lhs,rhs)
  puts "im inside set_dependency Function"
  cells = rhs.split(" ")
  #temp variable to push the dependent cell into the Hash
  temp = $dependent_hash[lhs.to_sym]||[]
  temp.push(cells[0])
  temp.push(cells[2])
  $dependent_hash[lhs.to_sym] = temp
end

def execute_string(lhs,rhs)
  puts "im inside execute_string Function for #{lhs} = #{rhs}"
  cells = rhs.split(" ")
#  resolve_dependency(cells[0].to_sym)
#    puts $dependent_hash[cells[0].to_sym]
#    puts $dependent_hash[cells[2].to_sym]


=begin
    if ($dependent_hash[cells[0].to_sym] == [])
      puts "empty array"

    else
      puts "not an empty array"
    end
    if (!$dependent_hash[cells[0].to_sym])
      puts "no value"
    else
      puts "not nil"
    end
=end

#  resolve_dependency(cells[2].to_sym)
  $array[lhs[1].to_i][$column_hash[lhs[0].to_sym]] = $array[cells[0][1].to_i][$column_hash[cells[0][0].to_sym]].send(cells[1],$array[cells[2][1].to_i][$column_hash[cells[2][0].to_sym]])

end

def resolve_dependency(input)
  puts "im inside resolve_dependency Function for #{input}"
  puts $dependent_hash[input]
  unless ($dependent_hash[input] == [] || !$dependent_hash[input])
      $dependent_hash[input].each do |key|
      execute_string(key, $expression_hash[key.to_sym])
    end
  end


end
=begin


=end
#interface to choose option
loop do
  puts "\nenter\n 1 \tto assign value \n 2\t for expression\n 3\t for exit"
  choice = gets.chomp.to_i
  case choice
  when 1 #to assign a value to the cell
    puts "enter the assignment like a1 = 5"
    inp_str = gets.chomp.to_s.upcase
    inp = inp_str.split(" = ")
    column = $column_hash[inp[0][0].to_sym]
    row = inp[0][1].to_i
    value = inp[1].to_i
    $array[row][column] = value
    resolve_dependency(inp[0].to_sym)




    print_array
  when 2 #to define an expression
    puts "enter the expression"
    inp_str = gets.chomp.to_s.upcase
    inp = inp_str.split(" = ")
    lhs = inp[0]
    rhs = inp[1]
    #saving the input expression into expression_hash
    $expression_hash[lhs.to_sym] = rhs
    set_dependency(lhs,rhs)
    execute_string(lhs,rhs)




    print_array





  when 3
    break

  else
    puts "invalid input, Try again"
  end






end
