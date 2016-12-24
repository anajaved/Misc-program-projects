#importing pandas library
import pandas as pd

#sample dfA and dfB dataframes to test on
dfA = pd.DataFrame({'A': ['A0', 'A1', 'A2', 'A3'],
                    'B': ['B0', 'B1', 'B2', 'B3'],
                    'C': ['C0', 'C1', 'C2', 'C3'], 
                    'D': ['D0', 'D1', 'D2', 'D3']})

   
dfB = pd.DataFrame({'A': ['A4', 'A5', 'A6', 'A7'],
                    'B': ['B4', 'B5', 'B6', 'B7'],
                    'C': ['C0', 'C1', 'C2', 'C3'],
                    'D': ['D4', 'D5', 'D6', 'D7']})
        
        
def df_join(dfA, dfB, type, column_name):
    #docstring
    '''
    type:
        'left' for Left Outer Join
        'right' for Right Outer Join
        'outer' for Full Outer Join
        or 'inner' for Inner Join
        
    column_name: 
        can be one string or a list of strings
    '''
    
    #merging df
    type= str(type)
    combined_df=pd.merge(dfA, dfB, on=column_name, how=type, indicator=True)
    
    #creating _merge column
    temp_list=[]
    for value in combined_df['_merge']:
        if value == 'both':
            value = 1
            temp_list.append(value)
        elif value == 'right_only':
            value = 3
            temp_list.append(value)
        else:
            value = 2
            temp_list.append(value)
    
    combined_df['_merge'] = temp_list
    
    #printing table & row counts
    print combined_df
    print "Total Row Count:", len(combined_df.index)  
    
    #return counts 
    if 1 in temp_list:
        print "dfA & dfB Rows:", temp_list.count(1)
    if 2 in temp_list:
        print "dfA Rows:", temp_list.count(2)
    if 3 in temp_list:
        print "dfB Rows:", temp_list.count(3)
    
    

df_join(dfA, dfB, 'right', ['A', 'C'])