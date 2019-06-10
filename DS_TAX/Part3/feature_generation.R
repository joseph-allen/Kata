# read in data
df <- read.csv("~/Code/taxi-project/Part2/data/data.csv")

# Check Data
# print(summary(df))

# Drop Rows where Error count or outlier count is higher than 0
df<-df[df$error_count == 0,]

# Drop NA rows in latlons
df<-df[df$missing_values_count == 0,]

# Drop columns we don't need in PCA
df <- df[ , !names(df) %in% c('X', 'X.1', 'error_count', 'outlier_count', 'missing_values_count', 'not_store_and_fwd')]

# Convert Lpep times to Unix
as.numeric(as.POSIXct("2013-09-16 2:13:46 EST"))
df['pickup_unix'] = apply(df['lpep_pickup_datetime'], 1, function(x) as.numeric(as.POSIXct(x)))
df['dropoff_unix'] = apply(df['Lpep_dropoff_datetime'], 1, function(x) as.numeric(as.POSIXct(x)))

# Drop columns no longer needed
df <- df[ , !names(df) %in% c('lpep_pickup_datetime', 'Lpep_dropoff_datetime')]

# Table VendorId
print(table(df['VendorID']))

# One Hot encode VendorID
df['VendorID_LLC'] = df['VendorID'] == 'LLC'
df['VendorID_Verifone'] = df['VendorID'] == 'Verifone'
# Drop VendorID
df <- df[ , !names(df) %in% c('VendorID')]

# Table RateCodeID
print(table(df['RateCodeID']))

# One Hot encode RateCodeID
df['RateCodeID_NF'] = df['RateCodeID'] == 'Negotiated fare'
df['RateCodeID_Standard'] = df['RateCodeID'] == 'Standard'
# Drop RateCodeID
df <- df[ , !names(df) %in% c('RateCodeID')]

# Table Payment_type
print(table(df['Payment_type']))

# One Hot encode Payment_type
df['Payment_type_Cash'] = df['Payment_type'] == 'Cash'
df['Payment_type_CreditCard'] = df['Payment_type'] == 'CreditCard'
df['Payment_type_CreditCart'] = df['Payment_type'] == 'CreditCart'
# Drop Payment_type
df <- df[ , !names(df) %in% c('Payment_type')]


# Table Trip_type
print(table(df['Trip_type']))

# One Hot encode Trip_type
df['Trip_type_Dispatch'] = df['Trip_type'] == 'Dispatch'
df['Trip_type_street_hail'] = df['Trip_type'] == 'Street-hail'
# Drop Trip_type
df <- df[ , !names(df) %in% c('Trip_type')]

# Generate feature trip time in seconds
df['trip_time_seconds'] = df['dropoff_unix'] - df['pickup_unix']
df <- df[ , !names(df) %in% c('total_time')]

# Generate feature velocity
df['velocity'] = df['Trip_distance'] / df['trip_time_seconds']

# Convert bools to ints
df['VendorID_LLC_int'] = sapply(df['VendorID_LLC'], as.integer)
df['VendorID_Verifone_int'] = sapply(df['VendorID_Verifone'], as.integer)
df['RateCodeID_NF_int'] = sapply(df['RateCodeID_NF'], as.integer)
df['RateCodeID_Standard_int'] = sapply(df['RateCodeID_Standard'], as.integer)
df['Payment_type_Cash_int'] = sapply(df['Payment_type_Cash'], as.integer)
df['Payment_type_CreditCard_int'] = sapply(df['Payment_type_CreditCard'], as.integer)
df['Payment_type_CreditCart_int'] = sapply(df['Payment_type_CreditCart'], as.integer)
df['Trip_type_Dispatch_int'] = sapply(df['Trip_type_Dispatch'], as.integer)
df['Trip_type_street_hail_int'] = sapply(df['Trip_type_street_hail'], as.integer)

# Drop old bools
df <- df[ , !names(df) %in% c('VendorID_LLC', 'VendorID_Verifone', 'RateCodeID_NF', 'RateCodeID_Standard', 'Payment_type_Cash', 'Payment_type_CreditCard', 'Payment_type_CreditCart', 'Trip_type_Dispatch', 'Trip_type_street_hail')]


normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}

# Normalize all data
dfNorm <- as.data.frame(lapply(df, normalize))
# move columns which cannot be normalized
dfNorm['Pickup_longitude'] = df['Pickup_longitude']
dfNorm['Pickup_latitude'] = df['Pickup_latitude']
dfNorm['Dropoff_longitude'] = df['Dropoff_longitude']
dfNorm['Dropoff_latitude'] = df['Dropoff_latitude']
dfNorm['Trip_distance'] = df['Trip_distance']
dfNorm['velocity'] = df['velocity']

# output norm_data
write.csv(dfNorm, "~/Code/taxi-project/Part2/normalised_data.csv")