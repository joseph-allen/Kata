# imports
import sys
import csv

transaction_count = 0.
count = 0.

# Read in CSV
print "Importing :", sys.argv[1]
with open(sys.argv[1], 'rb') as csvfile:
     spamreader = csv.reader(csvfile, delimiter=',', quotechar='|')
     for row in spamreader:
         count += 1
         if(row[1] == '1'):
             transaction_count += 1

# Outputs
print "number of transactions: ", transaction_count
print "number of sessions: ", count
print "conversion :", transaction_count/count
