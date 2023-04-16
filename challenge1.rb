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

# 4. Start with an array of travel destinations. Print every travel destination in alphabetical order embedded in a sentence using string interpolation. For example, if the destination is "New York City", print something like "The next place I want to visit is New York City!" 

destinations = ["Hawaii", "Peru", "Puerto Rico", "California", "France", "Cancun"]

destinations.each do |destination|
    p "I'm going to #{destination}, as soon as I'm employed for like a year."
end

p destinations.sort


# 5. Given a sentence with only lowercase letters, print the same sentence with the first letter of every word capitalized. For example, if you were given "Turing is the best", return "Turing Is The Best" instead!

# Internet says this method .titleize will print the string in "titlecase", however further research seems to indicate that this is only for rails.

#p "this is a sentence about the best sentence in the world".titleize #does not work outside of rails

# .titleize method created manually
# first, I realized I need to split up each word in the string so I could try to capitalize every first letter of each word

sentence = "this is a sentence about the best sentence in the world"

def titleize(string)
    p string.split
end

p titleize(sentence)
#==> .split method takes a string and converts it into an array with each word separated by a comma ---
#returns ["this", "sentence", "only", "has", "lower", "case", "letters"]
# I know that I need to interate through every iscolated word.  I found a line of code on stackoverflow that worked so added that to my titleize method. 
# .map the called upon block and executes the block for each element
# .each iterates over each element but it seems to only return the items without executing the fully block
# once the string is split and mapped, and each word is capitalized individually, the separated words have to be joined back together, hense .join.  The (" ") give the .join method an argument which says join it back to a string from the array it was "split" into.

def titleize(string)
    string.split(/ |\_/).map(&:capitalize).join(" ")
end

p titleize(sentence)
#==> returns "This Is A Sentence About The Best Sentence In The World"

# this code below also works - im not sure why the author in stackoverflow used the strange characters (/ |\_/)
# also, I'm not sure why the (&:method) -- &: -- works. 
# I understand that .map works on arrays, which is why it works after the .split turned our sentence into an array.
# the .join method here will work without the paremeter but it will just be a jumble.  The (" ") paramenter tells Ruby to put a space in between each joined item.

sentence = "this is a sentence about the best sentence in the world"

def titleize(string)
  string.split.map(&:capitalize).join(" ")
end

p titleize(sentence)

# the code below also worked in a similar way but just uses a block, so would have to be rewriten for each new array.
# the block below does not need .split because it is already an array
# the method is better because it can be applied to any array without rewriting the code.
# summary: 1 .split breaks the string into an array 2 .map then iterates through the array and 3 takes argument to method .capitalize, 4 then .join turns the array back into a string and (" ") makes sure it does so with a space in between each word.

array = %w[this is a sentence about the best sentence]

p array.map { |string| string.capitalize }.join(" ")

# 5. Write a method or function that determines how much a person will [pay in taxes in the United States](https://www.irs.gov/newsroom/irs-provides-tax-inflation-adjustments-for-tax-year-2022) based on their annual income. The method or function should accept a number representing the individual's annual income as an argument and return the amount they will owe in taxes for that year.


# I started with defining a method that will calculate a different percentage depending on the annual_income argument given when method was called.  
# I created a different method for single vs married.
# I then tried to figure out how to differentiate between the two methods.
# Ideally, I would want to prompt the user for input using gets.chomp to ask two questions, marital status and annual income. Based on those answer the method would return the amount owed based on what method is used.
# I'm not sure how to do that yet, still working...

def single(annual_income)
  if annual_income > 215950 == true
    annual_income * 0.35 
  elsif annual_income > 170050 == true
    annual_income * 0.32
  elsif annual_income > 89075 == true
    annual_income * 0.24
  elsif annual_income > 41775 == true
    annual_income * 0.22
  elsif annual_income > 10275 == true
    annual_income * 0.12
  else
    annual_income * 0.10
  end
end

def married(annual_income)
  if annual_income > 431900 == true
    annual_income * 0.35 
  elsif annual_income > 340100 == true
    annual_income * 0.32
  elsif annual_income > 178150 == true
    annual_income * 0.24
  elsif annual_income > 83550 == true
    annual_income * 0.22
  elsif annual_income > 20550 == true
    annual_income * 0.12
  else
    annual_income * 0.10
  end
end

p married(500000)
p single(50000)
