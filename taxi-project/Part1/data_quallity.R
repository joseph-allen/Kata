# read in data
df <- read.csv("~/Code/taxi-project/sample.csv")

# Per Variable, count number of missing values. errors. outliers
#VendorID
# By summary of VendorID min is 1 and max is 2.
print(table(df['VendorID']))
# 1070 1s, 3930 2s. nothing to drop

#lpep_pickup_datetime
# I cannot tell
#print(describe(df['lpep_pickup_datetime']))
#Lpep_dropoff_datetime

#Store_and_fwd_flag
print(table(df['Store_and_fwd_flag']))
# 4987 N, 13 Y

#RateCodeID    
print(table(df['RateCodeID']))
#    1    2    3    4    5 
# 4866   23    3    1  107 

#Pickup_longitude 
print(summary(df['Pickup_longitude']))
# min -75.12
# max 0.00, this is definitely a mistake
print(summary(df['Pickup_longitude']))

# There are 16 records of 0.00 incorrectly set. to be dropped.
print(table(df$Pickup_longitude == 0.00))

#Pickup_latitude 
print(summary(df['Pickup_latitude']))
# min 0.00
# max 40.90
print(table(df$Pickup_latitude == 0.00))
# There are 16 records of 0.00 incorrectly set. to be dropped. are these the same as the above?

#Dropoff_longitude
print(summary(df['Dropoff_longitude']))
# min -75.12
# max 0.00
print(table(df$Dropoff_longitude == 0.00))
# There are 16 records of 0.00 incorrectly set. to be dropped. are these the same as the above?

#Dropoff_latitude   
print(summary(df['Dropoff_latitude']))
# min 0.00
# max 40.93 
print(table(df$Dropoff_latitude == 0.00))
# There are 16 records of 0.00 incorrectly set. to be dropped. are these the same as the above?

#Passenger_count 
print(summary(df['Passenger_count']))
# min 0.000
# max 6.000
# a journey without passengers makes no sense, these are errors
print(table(df['Passenger_count']))
# There is only one case with 0 passenger, to be dropped.

#Trip_distance    
print(summary(df['Trip_distance']))
# There are some 0 mile journeys which are errors
print(table(df$Trip_distance == 0.00))
# FALSE  TRUE 
# 4917    83
# 83 to be dropped

#Fare_amount
print(summary(df['Fare_amount']))
# min -10.0
# max 124.5
print(table(df$Fare_amount <= 0.0))
# there are 19 cases where the fare amount is less than or equal 0.

#Extra
print(summary(df['Extra']))
# min -1.0000
# max 1.0000
print(table(df$Fare_amount < 0.0))
# there are 5 cases lower than 0

#MTA_tax   
print(summary(df['MTA_tax']))
# Min.   :-0.5000  
# Max.   : 0.5000 
print(table(df$MTA_tax < 0.0000))
# there are 3 cases lower than 0

#Tip_amount 
print(summary(df['Tip_amount']))
# Min.   : 0  
# Max.   : 51.000
# nothing missing, there are suspsciously high outliers to deal with though

#Tolls_amount   
print(summary(df['Tolls_amount']))
# Min.   : 0  
# Max.   : 20.00000

#Ehail_fee  
print(summary(df['Ehail_fee']))
# The whole column is NA, so we should simply drop this column

#improvement_surcharge
print(summary(df['improvement_surcharge']))
# Min.   :-0.3000   
# Max.   : 0.3000  
print(table(df$improvement_surcharge < 0.0000))
# 3 less than 0 to drop.

#Total_amount   
print(summary(df['Total_amount']))
# Min.   :-10.00 
# Max.   :125.30  
print(table(df$Total_amount < 0.0000))
# 5 less than 0 to drop.

#Payment_type
print(table(df['Payment_type']))
# 1    2    3    4 
# 2528 2432   24   16 
# nothing out the ordinary

#Trip_type  
print(table(df['Trip_type']))
# 1    2 
# 4895  105 

#total_time    
print(summary(df['total_time']))
# min : 0
# max : 86141
print(table(df$total_time == 0))
print(table(df$total_time > 86000))
# 86141 is just under a full day, there also shouldn't be 0 second journeys. drop 0 or below, there are also high outliers

# Error count
#Pickup/Dropoff Longitude/Latitude contribute 16 errors with 0 values.
#Passenger Count has 0 values, this is an error.
#Trip distance has 83 0 mile trips.
#Fare amount has 19 less than zero values.
#Extra has 5 cases less than 0.
#MTA tax has 3 cases less than 0.
#Improvement surcharge has negative values, these are errors.
#Total Amount, 5 values less than 0.
#Total time, 0 and 86141 is clearly an error.

df['error_count'] = as.numeric(df$Pickup_longitude == 0) + as.numeric(df$Pickup_latitude == 0) +
as.numeric(df$Dropoff_longitude == 0) + 
as.numeric(df$Dropoff_latitude == 0) + 
as.numeric(df$Passenger_count == 0) + 
as.numeric(df$Trip_distance == 0) + 
as.numeric(df$Fare_amount < 0) +
as.numeric(df$Extra < 0) +
as.numeric(df$MTA_tax < 0) +
as.numeric(df$improvement_surcharge < 0) +
as.numeric(df$Total_amount < 0) +
as.numeric(df$total_time == 0) +
as.numeric(df$total_time == 86141)

# Plots
# boxplot(df$Tip_amount)
# hist(df$total_time)

# outliers
# quantile(df$total_time, 0.05)
# quantile(df$total_time, 0.95)
no_outlier_time = df[(df$total_time < 1989) & (df$total_time > 60), ]
# hist(no_outlier_time$total_time)
# quantile(df$Tip_amount, 0.05)
# quantile(df$Tip_amount, 0.95)
no_outlier_tip = df[df$Tip_amount < 5, ]
# hist(no_outlier_tip$Tip_amount)

# individual outliers column
df['outlier_count'] = as.numeric(df$total_time > 1989) + as.numeric(df$total_time < 60) + as.numeric(df$Tip_amount > 5)
