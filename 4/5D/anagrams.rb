
def first_anagram?(string1, string2)
  chars = string1.chars
  words = chars.permutation.to_a
  words.each {|wrd| return true if string2 == wrd.join}
  false
end # O(n!)  

# p first_anagram?("apple", "pplae")

def second_anagram?(string1, string2)
  #alpha = ('a'..'z').to_a
  return false unless string1.length == string2.length
  chars = []
  string2.each_char { |c| chars << c }
  (0...string1.length).each do |i|
    if chars.include?(string1[i])
        idx = chars.find_index(string1[i])
        chars.delete_at(idx)
    end
  end
  return true if chars.empty?
  false
end # O(n^2) if .find_index is another iteration

# p second_anagram?("banana", "bnnaaa")
# p second_anagram?("bannnnaaaa", "bnnaaa")

def third_anagram?(string1, string2)
    string1.chars.sort == string2.chars.sort
end # O nlog(n)

# p third_anagram?("banana", "bnnaaa")
# p third_anagram?("bannnnaaaa", "bnnaaa")

def fourth_anagram?(string1, string2)
  count = Hash.new(0)
  string1.each_char {|char| count[char] += 1}
  string2.each_char {|char| count[char] -= 1}
  count.values.all?(0)
end #O(n)


p first_anagram?("abahdfnana", "bnanaaa")
p first_anagram?("baahdaa", "bnnaaa")

p second_anagram?("zzzabanana", "bnzaznzaaa")
p second_anagram?("bannnnaaaa", "bnnaaa")

p third_anagram?("zzzabanana", "bnzaznzaaa")
p third_anagram?("bannnnaaaa", "bnnaaa")

p fourth_anagram?("zzzabanana", "bnzaznzaaa")
p fourth_anagram?("bannnnaaaa", "bnnaaa")


# alpha = ('a'..'z').to_a
