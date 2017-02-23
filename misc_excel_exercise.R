install.packages('readxl')
setwd("~/Desktop")

library(readxl)

Parent_vendor_df <- read_excel("Ana_Javed_Exercise.xlsx", sheet= "Parent Vendor Information")
raw_data_df <- read_excel("Ana_Javed_Exercise.xlsx", sheet= "RawData")

#Task 1: Populate "Parent Vendor" from ParentVendorInformation table in RawData Table:

combined_df <- merge(x=raw_data_df, y=Parent_vendor_df, by="Manufacturer", all.x=TRUE)

#Task 2: Using means including a pivot table or other function, and using the information in the 
#"RawData" tab, build a table showing spend by category, with the ability to drill down into the parent 
#vendors, and then into the item descriptions