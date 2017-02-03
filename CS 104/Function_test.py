# A few sample function calls
from sample_functions import encouraging_words, area

# The call to encouraging_words() is a statement
name = raw_input("What's your name? ")
encouraging_words(name)
print

# The call to the area() function is an expression
x = input("How wide is your room? ")
y = input("How long is your room? ")
cost = 1.50 * area(x, y)
print "Your carpet will cost $" + str(cost)



