#even odd check whole numbers & if the number is divisible by 4 

num= raw_input ("Please, enter a whole number")
try: 
    number = int (num)
except:  
    print "You did not enter a whole number. Try again."
if number%2 == 0:
    print "You've eventered an even number!"
else:
    print "You've entered an odd number!" 

if number%4 == 0:
    print "This number is also divisble by 4!"