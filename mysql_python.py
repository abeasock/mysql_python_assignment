# This python script will query the coaches table in MySQL and calculate 
# a coach's total games and total wins in the regular season. Then calculates 
# the coach's overall winning percentage in the regular season. The data is 
# sorted by percentage of wins. Lastly, the result is printed out.

from sqlalchemy import *
from itertools import groupby

# Update the username and password in the next line to be your login in to your MySQL server
engine = create_engine("mysql+pymysql://<username>:<password>@localhost/hockey")
conn = engine.connect()

coach_data = conn.execute('select coachID, g, w from coaches').fetchall()

results = {}

for record in coach_data:
	if record[0] not in results:
		results[record[0]] = [ record[1], record[2] ]
	else:
		results[record[0]] = [ results[record[0]][0]+record[1], results[record[0]][1]+record[2]]

aggregation = []
for key, value in results.items():
	aggregation.append([key, (value[1] / float(value[0])) * 100])

aggregation.sort(key=lambda x: x[1], reverse=True)

for i in aggregation:
	print i
