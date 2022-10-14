#no_dupes?

def no_dupes?(arr) #DONE
    hash = Hash.new(0)
    arr.each {|ele| hash[ele] += 1 }
    new_arr = []
    hash.each do |key, value|
        if value == 1
            new_arr << key
        end 
    end
    new_arr

end

# # Examples
# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []



#no_consecutive_repeats?  #DONE

def no_consecutive_repeats?(arr)
    (0...arr.length - 1).each do |i|
        return false if arr[i] == arr[i+1]
    end
    true
end

# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true



#char_indices #DONE

def char_indices(str)
    hash = Hash.new {|k, v| k[v] = []}
    str.each_char.with_index do |char, i |
        hash[char] << i
    end
    hash
end


# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}



#longest_streak   #NEED TO FINISH
def longest_streak(str)
    current = ""
    longest = ""

    (0...str.length).each do |i|
        if str[i] == str[i - 1] || i == 0
            current += str[i]
        else
            current = str[i]
        end

        if current.length >= longest.length
            longest = current
        end
    end
    longest

          #Solution with hash, last example doesn't pass the test case

    # return str if str.length == 1
   
    # hash = Hash.new(1)
    
    # (0...str.length - 1).each do |i|
    #     if str[i] == str[i+1]
    #         hash[str[i]] += 1
    #     end
    # end

    # long_streak = hash.sort_by {|k, v| v}
    # # long_streak
    
    # if long_streak.kind_of?(Array)
    #     long_streak[-1][0] * long_streak[-1][1]
    # # elsif
    # #     return str[str.length - 1]
    # end

    # # return str.split("")[-1]

    # # hash
    # #iterate over hash and 
    

end

# # Examples
# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'



#bi_prime? DONE

def bi_prime?(num)
    factors = facts(num)
    bi_prime = factors.select {|n| prime?(n)}
    
    if bi_prime.inject{|acc,el| acc * el} == num || (bi_prime[0] * bi_prime[0]) == num
        true
    else
        false
    end
end

def prime? (num)
    return false if num < 2
    (2...num).each do |n|
        return false if num % n == 0
    end
    true
end

def facts(num)
    (1..num).select {|n| num % n == 0}
end

# # Examples
# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false


#vigenere_cipher

def vigenere_cipher(str, shift)
    alphabet = ("a".."z").to_a
    new_str = ""
    str.each_char do |char|
        position = (alphabet.index(char) + shift[0]) % 26
        new_str += alphabet[position]
        shift.rotate!
    end
    new_str
end


# Examples
p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
p vigenere_cipher("yawn", [5, 1])             # => "dbbo"




#vowel_rotate

def vowel_rotate(str)

end

def vow_indices(str) # we got the vowels' positions in the string
    vowels = "aeiou"
    indices = []
    str.each_char.with_index do |char, i|
        indices << i if vowels.include?(char)
    end
    indices
end


# Examples
# vowel_rotate('computer')      # => "cempotur"
# vowel_rotate('oranges')       # => "erongas"
# vowel_rotate('headphones')    # => "heedphanos"
# vowel_rotate('bootcamp')      # => "baotcomp"
# vowel_rotate('awesome')       # => "ewasemo"


#PROC PROBLEMS *DONE

class String

    def select(&blk)
        blk ||= Proc.new {false}
        new_str = ""
        self.each_char do |ch|
            # if blk
                new_str += ch if blk.call(ch)
            # end
        end
        new_str
    end


    def map!(&blk)
        self.each_char.with_index do |char, i|
            self[i] = blk.call(char,i)
        end
        self
    end

end

# p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
# p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
# p "HELLOworld".select          # => ""

# # Examples
# word_1 = "Lovelace"
# word_1.map! do |ch| 
#     if ch == 'e'
#         '3'
#     elsif ch == 'a'
#         '4'
#     else
#         ch
#     end
# end
# p word_1        # => "Lov3l4c3"

# word_2 = "Dijkstra"
# word_2.map! do |ch, i|
#     if i.even?
#         ch.upcase
#     else
#         ch.downcase
#     end
# end
# p word_2        # => "DiJkStRa"



#RECURSION PROBLEMS

#multiply # DONE

def multiply(a,b)
    return 0 if  b == 0
    
    if b < 0
        -(a + multiply(a, (-b)-1))
    else
        a + multiply(a, b-1)
    end
end

# Examples
# p multiply(3, 5)        # => 15
# p multiply(5, 3)        # => 15
# p multiply(2, 4)        # => 8
# p multiply(0, 10)       # => 0
# p multiply(-3, -6)      # => 18
# p multiply(3, -6)       # => -18
# # p multiply(-3, 6)       # => -18




#lucas_sequence  DONE

def lucas_sequence(num)
    return [] if num == 0
    return [2] if num == 1
    return [2,1] if num == 2

    luc_seq = lucas_sequence(num - 1)
    next_ele = luc_seq[-2] + luc_seq[-1]
    luc_seq << next_ele
    luc_seq


end

# p lucas_sequence(0)   # => []
# p lucas_sequence(1)   # => [2]    
# p lucas_sequence(2)   # => [2, 1]
# p lucas_sequence(3)   # => [2, 1, 3]
# p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]


#prime_factorization

def prime_factorization(num)
    (2...num).each do |factor|
        if num % factor == 0
            other_factor = num / factor
            return [*prime_factorization(factor), *prime_factorization(other_factor)]
        end
    end   
    [num]
end


# # Examples
# p prime_factorization(12)     # => [2, 2, 3]
# p prime_factorization(24)     # => [2, 2, 2, 3]
# p prime_factorization(25)     # => [5, 5]
# p prime_factorization(60)     # => [2, 2, 3, 5]
# p prime_factorization(7)      # => [7]
# p prime_factorization(11)     # => [11]
# p prime_factorization(2017)   # => [2017]