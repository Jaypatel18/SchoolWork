a=input("what is the value for x^2?")
b=input("what is the value for x?")
c=input("what is the value for last number?")
square_root=((b * b) - 4 * a * c)**1/2
if  square_root >0:
    solution1 = (-b + square_root)/(2*a)
    solution2 = (-b - square_root)/(2*a)
    print ("The roots are ",solution1," and ",solution2)
elif square_root == 0:
    solution = (-b + square_root)/(2*a)
    print ("The roots are ",solution," and ",solution)
else:
    print ("There are no solutions")
