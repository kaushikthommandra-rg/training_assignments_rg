puts "enter the size of the grid"
size = gets.chomp.to_i

# Function to print the array
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
  a_rows = ['A','B','C','D','E','F','G','H','I','J']
  a_columns = ['0','1','2','3','4','5','6','7','8','9']
=begin
  array[0][0]=10
  array[0][1]=10
  array[0][2]=10
  array[0][3]=10
  array[0][4]=10
=end
  loop do

    puts "\nenter\n 1 to assign value \n 2 for expression\n 3 for exit"
    choice = gets.chomp.to_i
    case choice

      when 1
        puts "enter the assignment like a1 = 5"
        inp = gets.chomp.to_s
        #inp = "A1 = 5"
        value = inp.split.last.to_i
        row_val = inp[0].upcase
        column_val = inp [1]
        row = a_rows.index(row_val)
        column = a_columns.index(column_val)
        array[row][column] = value
        print_array(array,size)

      when 2
        puts "enter the expression"
        inp = gets.chomp.to_s.upcase
        expression = inp.split(" ")
        row_val0 = expression[0][0]
        column_val0 = expression[0][1]
        row0 = a_rows.index(row_val0)
        column0 = a_columns.index(column_val0)

        row_val1 = expression[2][0]
        column_val1 = expression[2][1]
        row1 = a_rows.index(row_val1)
        column1 = a_columns.index(column_val1)

        row_val2 = expression[4][0]
        column_val2 = expression[4][1]
        row2 = a_rows.index(row_val2)
        column2 = a_columns.index(column_val2)

        case expression[3]
          when "+"
            array[row0][column0]=array[row1][column1]+array[row2][column2]
          when "-"
            array[row0][column0]=array[row1][column1]-array[row2][column2]
          when "*"
            array[row0][column0]=array[row1][column1]*array[row2][column2]
          when "/"
            array[row0][column0]=array[row1][column1]/array[row2][column2]
        end
        print_array(array,size)



      when 3
        break
      else puts "invalid choice"

    end

  end
