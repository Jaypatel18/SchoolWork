def divisible_3(list):
    x =0
    for number in list:  
        if number % 3 == 0:
            x = x + 1
    return x
       
number = [3,6,9,15,22,1,55,8]
print divisible_3(number)
