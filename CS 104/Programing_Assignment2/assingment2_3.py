def bar_chart(list1):
    for r in list(list1):
        for c in range (1,r+1):
            print "*",
        print

bar_chart(list1=[2,4,5,6])
