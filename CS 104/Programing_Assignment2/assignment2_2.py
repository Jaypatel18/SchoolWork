def find_even():
    r=raw_input("enter a number")
    count=0
    numlist=[]
    while r!="q":
        if int(r)%2==0:
            count+=1
            numlist.append(r)
        r=raw_input("enter a number")
    print count,"even numbers in the list."
find_even()
