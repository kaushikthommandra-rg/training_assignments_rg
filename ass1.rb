puts "enter the size of the grid"
size = gets.chomp.to_i
def print_array(array,size)

for i in 0..size-1 do
  print "|"
    for j in 0..size-1 do
      print "#{array[i][j]} \t |"
    end
    print "\n"
  end

end
array = Array.new(size){Array.new(size,0)}
a_rows = ['A','B','C','D']
a_columns = ['0','1','2','3','4']


loop do

  puts "\nenter\n 1 to assign value \n 2 for expression\n 3 for exit"
  choice = gets.chomp.to_i
  case choice
=begin
    when 1



    # array[row.to_i - 'A'.to_i][column]=value
=end
    when 1
     puts "enter the assignment as A1 = 5"
     inp = gets.chomp.upcase!
  #  inp = "A1 = 5"
      value = inp.split.last
      row_val = inp[0]
      column_val = inp [1]
      value.to_i
      #puts column
    #  puts "row is #{row_val}, column is #{column}, and the value is #{value}"
puts row_val
 row = a_rows.index(row_val)
puts row
column = a_columns.index(column_val)
puts column
     array[row][column] = value
     print_array(array,size)
    when 2
      puts "enter the expression"
      inp = gets.chomp.upcase!

    when 3
      break
    else puts "invalid choice"

  end

end
