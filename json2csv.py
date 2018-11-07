import csv
import json

infile = open("","r")
outfile = open("","w")

writer = csv.writer(outfile)

for row in json.loads(infile.read())
	writer.writerow(row)