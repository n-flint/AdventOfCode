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
    # require 'pry'; binding.pry
    # # require 'pry'; binding.pry

    final_combos = []
    bad_doubles = []
    # require 'pry'; binding.pry
    possible_combinations.each do |combo|
      # require 'pry'; binding.pry
      # final_combos << combo if melvin(combo)
      if melvin(combo) == true
        final_combos << combo
      elsif melvin(combo) == false
        bad_doubles << combo
      else
        require 'pry'; binding.pry
        p 'wtf'
      end
    end
    require 'pry'; binding.pry
    # possible_combinations.length
    # final_combos.length
    # bad_doubles.length
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
  
    # 519 answer is too low
    # 669 is fucked
    # 1110 good luck
  def self.melvin(input)
    # require 'pry'; binding.pry
    # just regexp looking for certain triples or fives?
    # count each character in the array, and see if it is odd, 1 3 5
    aoc = input.to_s.chars
    counter = 0
    #use this test to pass in booleans, then compare at the end that they are all true
    test = []
      aoc.each do |num|
        # require 'pry';  binding.pry
        # is this numm uniq first of all?
        # require 'pry'; binding.pry
        # if aoc.count(num).even? 

        # does the number matches the one next to it?
        # aoc[counter.to_i + 1]
        if num == aoc[counter.next]
          # require 'pry'; binding.pry
          p 'num = the next num'
          p "current num is #{num}"
          counter += 1
          if counter == 6
            return true
          end
        else num == aoc[counter.to_i + 3]
          p 'the ol'' switcharoo'
          counter += 1
          if counter == 6
            return true
          end
        counter +=1
          if counter == 6
            return false
          end
        end
      end
  end

  def self.chop_suey(input)
    aoc = input.to_s.chars
    counter = 0
    
    aoc.each do |num|
    # counter = 0

      require 'pry'; binding.pry
      if aoc.count(num).even?
        if num  == aoc[counter + 1] #&& num  == aoc[counter + 2] 
          require 'pry'; binding.pry
          # num has at least three in a row
          counter += 1
        else
          #num 
        end
        # does it match the next one? 
        # does it match the next 2?
        require 'pry'; binding.pry
      else
        p "#{num} is the current num, and is not a double"
        # num did not match the next number
        # or maybe it is just not an even number
        require 'pry'; binding.pry
        counter += 1
      end
      # num is not an even number
    end
  end

end

# puzzle_input = '128392-643281'
# p Password.find_passwords(puzzle_input)

# p Password.chop_suey('112233')
p Password.chop_suey('133444')

# p Password.melvin('112233')
# p Password.melvin('123444')
# p Password.melvin('111122')
# p Password.melvin('123466')





# turn all the doubles into a hash, if there are any odd numbers, then fuck it