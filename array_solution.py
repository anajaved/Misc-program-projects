def solution(A): 
    N= len(A)
    count=0
    for i, val in enumerate(A):
        check_in_list = A[val]
        if (check_in_list in A) & (A[i] != check_in_list):
                print "yes", val
                count+= 1
        else:
                print "no", val
    print count 


B=[1, 4, -1, 3, 2]
solution(B)
