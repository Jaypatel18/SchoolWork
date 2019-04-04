def  switcheroo (word):
    stng = word
    result = s[len(s)-1]+s[1:len(s)-1]+s[0]

    return result
s = raw_input (" Please enter your name: ")

print switcheroo (s)
