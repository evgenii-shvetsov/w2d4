# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]

require "byebug"

def all_vowel_pairs(words)
    pairs_arr= []
    
    (0..words.length).each do |i|
        (i..words.length).each do |j|
            pair = words[i].to_s + words[j]
            if vowels_checker(pair)
                pairs_arr << words[i] + " " + words[j]
            end
        end
    end
    pairs_arr

end

def vowels_checker(str)
    vowels = "aeiou"
    match = []

    str.each_char do |char|
        if vowels.include?(char) && !match.include?(char)
            match << char
        end
    end

    match.length == 5 ? true : false
        
end




# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
    (2...num).any? {|n| num % n == 0}
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    new_arr = []
    # words = str.split(" ")
    bigrams.each do |big|
        if str.include?(big)
            new_arr << big
        end
    end
    new_arr
end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
        prc ||= Proc.new {|key, val| key == val}
        new_hash = {}
        self.each do |key, val|
            if prc.call(key, val)
                new_hash[key] = val 
            end
        end
        new_hash
    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
        new_arr = []

        self.each_char.with_index do |char, i|
            k = 0 # 1
            j = i + k #  1 
            while j < self.length
                # debugger
                new_arr << self[i..j]
                k += 1
                j += 1
            end
        end

        length.nil? ? new_arr : new_arr.select {|ele| ele.length == length }
     
    end


    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
        alphabet = ("a".."z").to_a
        new_str = ""
        self.each_char do |char|
            pos = (alphabet.index(char) + num) % 26
            new_str += alphabet[pos]
        end
        new_str
    end
end
