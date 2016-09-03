#Greeting generator 

input = raw_input ("What is your name?")
def hello(name=" "):
    if len(input) >= 1:
        greeting = "Hello" + " " +input
    else:
        greeting = "Hello World"
    return greeting
g= hello ()  
print g