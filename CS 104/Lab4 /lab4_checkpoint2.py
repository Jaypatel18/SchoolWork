def name(Firstname):
    n = Firstname
    s = n.split()
    last = s [-1]
    first = s [0]
    result = last[0]+first[0:-1]
    result.lower ()
    return result.lower ()

s= raw_input ("Enter your Last name, First name")
print name(s)
    
    
    
    
