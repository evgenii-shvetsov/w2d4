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
    return str if str.length == 1
   
    hash = Hash.new(1)
    
    (0...str.length - 1).each do |i|
        if str[i] == str[i+1]
            hash[str[i]] += 1
        end
    end

    long_streak = hash.sort_by {|k, v| v}
    # long_streak
    
    if long_streak.kind_of?(Array)
        long_streak[-1][0] * long_streak[-1][1]
    # elsif
    #     return str[str.length - 1]
    end

    # return str.split("")[-1]

    # hash
    #iterate over hash and 
    

end

# # Examples
# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# # p longest_streak('abc')         # => 'c'



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

def vigenere_cipher

end

# Examples
# vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# vigenere_cipher("yawn", [5, 1])             # => "dbbo"




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


#PROC PROBLEMS

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

# Examples
word_1 = "Lovelace"
word_1.map! do |ch| 
    if ch == 'e'
        '3'
    elsif ch == 'a'
        '4'
    else
        ch
    end
end
p word_1        # => "Lov3l4c3"

word_2 = "Dijkstra"
word_2.map! do |ch, i|
    if i.even?
        ch.upcase
    else
        ch.downcase
    end
end
p word_2        # => "DiJkStRa"
