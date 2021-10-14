require "byebug"
# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    (1..(num_1*num_2)).each do |i|
        return i if i % num_1 == 0 && i % num_2 == 0
    end
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def getBigrams(str)
    grams = []
    str.each_char.with_index do |char, i|
        if i < str.length - 1
            grams << "#{char}#{str[i+1]}"
        end
    end
    grams 
end

def most_frequent_bigram(str)
    grams = getBigrams(str)
    grams
        .sort_by {|gram| grams.count(gram) }
        .last
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        inverted = Hash.new {|h,k| h[k] = []}
        self.each { |k, v| inverted[v] = k }
        inverted
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        count = 0
        self.each.with_index do |num1, i1|
            self.each.with_index do |num2, i2|
                if i2 > i1 && num1 + num2 == num 
                    count += 1
                end
            end
        end
        count
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
        notSorted = true
        prc ||= Proc.new {|ele1, ele2| ele1 <=> ele2 }
        while notSorted
            notSorted = false 
            (0...self.length - 1).each do |i|
                if prc.call(self[i], self[i +1]) == 1
                    notSorted = true
                    self[i], self[i + 1] = self[i + 1], self[i]
                end
            end
        end
        self
    end
end
