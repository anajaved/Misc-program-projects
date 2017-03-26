def solution(N):
    # write your code in Python 2.7
    for each in range(1, N+1):
        if int(each)%3 == 0:
        	if each%5 ==0:
        		if each%7 ==0:
        			print "FizzBuzzWoof"
        		else:
        			print "FizzBuzz"
        	elif each%7 ==0:
        		print "FizzWoof"
        	else:
        		print "Fizz"
        elif int(each)%5 ==0:
        	if each%7 ==0:
        		print "BuzzWoof"
        	else:	
        		print "Buzz"
        elif int(each)%7 ==0:
        	print "Woof"
        else:
        	print each 
 

solution(105)