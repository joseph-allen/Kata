# imports
import sys
import csv

zero_count = 0.
count = 0.

# Read in CSV
print "Importing :", sys.argv[1]
with open(sys.argv[1], 'rb') as csvfile:
     spamreader = csv.reader(csvfile, delimiter=',', quotechar='|')
     for row in spamreader:
         for col in row:
            count += 1
            if(col == '0' and col > 0):
                zero_count += 1

# Outputs
print "number of zeros: ", zero_count
print "number of stored data: ", count
print "zero percantage: ", zero_count/count