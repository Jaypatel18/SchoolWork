def perfect_number(x):
    thelist=[]
    for a in range (1,x):
        if x%a==0:
            thelist.append(a)
    print thelist
    num=sum(thelist)
    if num==x:
        print x,"is a Perfect Number!!"
perfect_number(6)
