
class Password

  def self.find_passwords(input)
    input_array = input.split('-')
    range_start = input_array[0].to_i
    range_end = input_array[1].to_i
    limit = (range_start..range_end)
    possible_combinations = []

    limit.each do |combo|
      if doubles(combo.to_s) && increase(combo.to_s)
        possible_combinations << combo
      end
    end

    final_combos = []
    possible_combinations.each do |combo|
      final_combos << combo if chop_suey(combo) == true
    end
    final_combos.length
  end

  def self.doubles(num)
    counter = 0 
    until counter == num.length
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

  def self.chop_suey(input)
    aoc = input.to_s.chars
    hashy = {}
    counter = 0

    aoc.each do |num|
      if aoc.count(num) == 1
        counter += 1
      else
        if num == aoc[counter + 1]
          hashy[num] = aoc.count(num)
          counter += 1
        else
          counter += 1
        end
      end
    end
    hashy.values.include?(2)
  end
end

puzzle_input = '128392-643281'
p Password.find_passwords(puzzle_input)

#offical examples
# p Password.chop_suey('112233')
# p Password.chop_suey('123444')
# p Password.chop_suey('111122')

# test cases from stack overflow
# p Password.chop_suey('123444') # false
# p Password.chop_suey('124444') # false
# p Password.chop_suey('113334') # true
# p Password.chop_suey('111334') # true
# p Password.chop_suey('113345') # true
# p Password.chop_suey('111122') # true
# p Password.chop_suey('112233') # true
# p Password.chop_suey('123445') # true
# p Password.chop_suey('123456') # false