#Leap years divisible by 4, except when divisibly by 100, unless divisible by 400.


yr = int(raw_input ("Enter the year:"))
year = yr % 4
if year != 0:
    print "This is not a leap year"
elif year == 0:
    hund = year % 100
    if hund == 0:
        four= hund %400
        if four == 0:
            print "Congrats! This is a leap year!"
        else:
            print "Not a leap year. Sorry."
            
    else:
        print "This is a leap year, yay!"

