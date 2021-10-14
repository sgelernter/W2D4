require "byebug"

def no_dupes?(arr)
    arr.select { |ele| arr.count(ele) == 1 }
end

# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(arr)
    (0...arr.length - 1).each do |i|
        return false if arr[i] == arr[i + 1]
    end
    true
end

# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)
    indices = Hash.new {|h,k| h[k] = [] }
    str.each_char.with_index { |char, i| indices[char] << i }
    indices 
end

# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)
    chunks = []
    arr = str.split("")
    max_streak = "#{arr[0]}"
    current_streak = ""
    arr.each.with_index do |char, i|
        current_streak.include?(char) ? current_streak += char : current_streak = char 
        if current_streak.length >= max_streak.length 
            max_streak = current_streak
        end
    end
    max_streak
end

# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'
def prime?(n)
    return false if n < 2
    (2...n).each { |i| return false if n % i == 0 }
    true
end

def bi_prime?(num)
    primeFactors = []
    (2...num).each {|n| primeFactors << n if num % n == 0 && prime?(n) }
    primeFactors.each do |fact1|
        primeFactors.each do |fact2|
            return true if fact1 * fact2 == num
        end
    end
    false  
end

# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false

def vigenere_cipher(message, keys)
    alpha = ("a".."z").to_a
    message_arr = message.split("")
    message_arr.map! do |char|
        key = keys[0]
        old_idx = alpha.index(char)
        new_idx = (old_idx + key) % 26
        keys.rotate!
        alpha[new_idx]
    end
    message_arr.join("")
end

# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

def vowel_rotate(str)
    vowels = "aeiou"
    word_vowels = []
    str.each_char {|char| word_vowels << char if vowels.include?(char)}
    word_vowels.rotate!(-1)
    str
        .split("")
        .map { |char| vowels.include?(char) ? word_vowels.shift : char}
        .join("")
end

# p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# p vowel_rotate('headphones')    # => "heedphanos"
# p vowel_rotate('bootcamp')      # => "baotcomp"
# p vowel_rotate('awesome')       # => "ewasemo"