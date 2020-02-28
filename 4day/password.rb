class Password

  def self.find_passwords(input)
    input_array = input.split('-')
    range_start = input_array[0].to_i
    range_end = input_array[1].to_i
    limit = (range_start..range_end)
    possible_combinations = []

    limit.each do |combo|
      # require 'pry'; binding.pry
      if doubles(combo.to_s) && increase(combo.to_s)
        possible_combinations << combo
        # require 'pry'; binding.pry
      end
    end
    possible_combinations.length
  end

  def self.doubles(num)
    counter = 0 
    until counter == 6
      if num[counter] == num[counter.next]
        return true
        break
      else
        counter += 1
      end
    end
    false  
  end

  def self.increase(num)
    counter = 0
    until counter == 5
        if num[counter].to_i <= num[counter.next].to_i
          counter +=1
        else
          return false
          break
        end
    end
    true
  end
end

puzzle_input = '128392-643281'
p Password.find_passwords(puzzle_input)

# p Password.doubles('111111')
# p Password.doubles('223450')
# p Password.doubles('123789')

# p Password.doubles('123788')
# p Password.doubles('127789')
# p Password.doubles('127789')
# p Password.doubles('125789')

# p Password.increase('111111')
# p Password.increase('223450')
# p Password.increase('123789')

# p Password.increase('123788')
# p Password.increase('127789')
# p Password.increase('125789')
# p Password.increase('232450')
# p Password.increase('263450')

