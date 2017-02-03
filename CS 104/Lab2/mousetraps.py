# This script computes the total amount for an order of mousetraps
# costing 2.00 each for the first 50, and 1.50 each thereafter

from math import ceil

num = input("How many mousetraps? ")

r = raw_input("are ou an iowa resident (y/n)?")

if num <= 50:
    subtotal = num * 2.00
else:
    first = 50 * 2.00
    extra = (num - 50) * 1.50
    subtotal = first + extra
print "Total:", subtotal

if r == "y":
    tax = subtotal * 0.06
    total = subtotal + tax
    print "Subtotal:" + str(subtotal)
    print "Tax:" + str(tax)
    print "Total:" + str(total)
else:
    total = subtotal
    print "Total:" + str(total)


box = ceil(num/50.00)

shipping = box * 5.0

print "shipping" + str(shipping)
total = total + shipping
print "total" + str(total)


    
