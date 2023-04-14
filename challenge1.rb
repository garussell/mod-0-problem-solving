# 1. Given an array of strings, print only the strings that have exactly 4 characters.

# start with an array
# search for ruby method that can determine length (.length)
# create conditional so it will only print elements with exactly 4 characters.

body_parts = ["hand", "foot", "leg", "ear", "stomach", "neck"]

body_parts.each do |body_part|
    if body_part.length == 4
        puts body_part
    end
end


# 2. Start with an array of strings with a mix of uppercase and lowercase letters. Print every word in all lowercase letters.

# create array with element that have uppercase and lowercase
# we want it to print only lowercase letters so need ruby method to do that (.downcase)
# needs to pring "every word" so we are iterating through each element using .each
# .each did not work, not sure why, but .map worked

days = ["sunday", "MoNday", "Tuesday", "wednesDay", "Thursday", "friday", "saturDAY"]

new_days = days.map do |day|
    day.downcase
end

p new_days

# this also works
days.each do |day|
    p day.downcase
end


# 3. Write a method or function that accepts an array of strings as an argument. 
# The method or function should return an array of only the words that include the letter combination "ing".

# started with def and end
# "should return" to me implies .push to new array
# added "words_with_ing" and put (array) so it could accept any array. I don't know what is going in there yet, and we want to apply it to any array.
# the work "include" in the instructions cued me to use the .include? method
# added .downcase to make sure we catch upper and lower case words

def words_with_ing(array)
    only_ing = []

    array.each do |word|
        if word.downcase.include?("ing")
            only_ing.push(word)
        end
    end

    only_ing
end

activities = ["drumming", "skiing", "crochet", "billiards", "knitting"]

p words_with_ing(activities)

# ==> ["drumming", "skiing", "knitting"]

# I am going to work on the remaing problems after Mod 0 since i did run out of time today. :)