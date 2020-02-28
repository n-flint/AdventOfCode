# 519 answer is too low
# 669 is fucked
# 1110 good luck
# 1240
# 1390 bitch


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
      if chop_suey(combo) == true
        final_combos << combo
      elsif chop_suey(combo) == false
        bad_doubles << combo
      else
        require 'pry'; binding.pry
        p 'wtf'
      end
    end
    # possible_combinations.length
    final_combos.length
    # bad_doubles.length
    # require 'pry'; binding.pry
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
    # HEY DUMMY, pair of numbers can not be in groups of bigger number groups. ex 444 is not cool, but 4444, as it is 
    aoc = input.to_s.chars
    # aocu = aoc.uniq
    test_2 = []
    hashy = {}
    counter = 0

    aoc.each do |num|
      # require 'pry'; binding.pry
      if aoc.count(num) == 1
        # require 'pry'; binding.pry
        counter += 1
      else
        if num == aoc[counter + 1]
        # start checking from the last number to see if it matches?
        #num matches the next number, now search for a big group of numbers you cognititalvy challenged fool, nice spelling dummy
        hashy[num] = aoc.count(num)
          # require 'pry'; binding.pry
        counter += 1
          
        # require 'pry'; binding.pry

        else
        # yay the num does not match the next num, wtf now
        # require 'pry'; binding.pry
        counter += 1
        end
      end

      # if num == aoc[counter + 1]
      #   # start checking from the last number to see if it matches?
      #   #num matches the next number, now search for a big group of numbers you cognititalvy challenged fool, nice spelling dummy

      #   counter += 1
      #   require 'pry'; binding.pry

      # else
      #   # yay the num does not match the next num, wtf now
      #   require 'pry'; binding.pry
      #   counter += 1
      # end
      # if aoc.count(num).even?
      #   test_2 << true
      # else
      #   # require 'pry'; binding.pry
      #   test_2 << false
      # end
    end
    # is there any falesesese
    # if test_2.include?(false)
    #   return false
    # else
    #   return true
    # end
    # require 'pry'; binding.pry
    if hashy.values.include?(2)
      # puts "#{hashy}, yay this inlcudes at least a group"
      true
    else
    
    # puts "#{hashy}, all doubles are part of larger groups?"
    false
    end
  end
end

puzzle_input = '128392-643281'
p Password.find_passwords(puzzle_input)

#offical examples
# p Password.chop_suey('112233')
# p Password.chop_suey('123444')
# p Password.chop_suey('111122')
#made up shit
# p Password.chop_suey('133444')

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


# p Password.melvin('112233')
# p Password.melvin('123444')
# p Password.melvin('111122')
# p Password.melvin('123466')





# turn all the doubles into a hash, if there are any odd numbers, then fuck it