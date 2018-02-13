from math import ceil
weight = input ("Please enter the weight of the letter in ounce")
if  weight >3.5:
    cost = 0.88 + ceil(weight-1.00)*0.17
else:
    cost = 0.44
    if weight >1.00:
        cost = cost + ceil(weight-1.00)*0.17

   
print "cost: ", cost
