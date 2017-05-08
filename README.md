To replicate the work I completed for this assignment follow the steps below. In each command example replace <downloaded-location-of-scripts> with the path where you saved the downloaded the scripts from my GitHub repo. Note: I ran these commands in terminal on Mac OS X.

1. Download the open source Hockey Database hosted here: [http://www.opensourcesports.com/hockey/](http://www.opensourcesports.com/hockey/)

2. Start your MySQL server by running the command:

	```sql
	mysql.server start
	```

3. Connect to MySql by running the command (in my case, I'm using root because I have not usernames set up): 

	```sql
	mysql -u root -p
	```

4. Create a database named **hockey** and create table schemas for the following data sets: *Master*, *Coaches*, and *AwardsPlayers* by running the `create_db_schema.sql` script. This can be completed by running the command while connected to MySQL: 

	```sql
	source <downloaded-location-of-scripts>/create_db_schema.sql;
	```

5. Load the data from the above data sets into the table schemas created in the previous step by running the `load_data.sql` script. **Note:** In the script, you must update the three *LOAD DATA INFILE* lines to the location you saved the downloaded the data. Once you update the script, you can execute the script by running this command while connected to MySQL: 

	```sql
	source <downloaded-location-of-scripts>/load_data.sql;
	```

6. Several queries were created to answer questions about the data:

	6.1.  A query was written in MySQL to rank the coaches for each year by number of wins. This query can be found in the file `coaches_wins_ranked.sql` and run by the command while (must be connected to MySQL): 

	```sql
    source <downloaded-location-of-scripts>/coaches_wins_ranked.sql;
    ```

	6.2.  A query was written in MySQL to rank the player for each year for number of awards. This was saved as a stored procedure. This stored procedure can be created by running the file `players_awards_ranked.sql`. The script also includes the code to run the stored procedure, but it is currently commented out. Create the stored procedure by using the command (must be connected to MySQL): 

	```sql
    source <downloaded-location-of-scripts>/players_awards_ranked.sql; 
  	```

  	6.3.  A query was written to get the details of a player who won the maximum number of awards for a year during which the coach for that team also has the maximum wins. In order to complete this task, I had to use the scoring data set in addition to the 3 tables above because I needed to figure out what team a player was on by linking player_ID to tmID, and this connection seemed to be missing from the former 3 tables. The script `create_scoring_table.sql` will create a table schema and load the data set into a table named scoring. The file `player_details_query.sql` contains the script for a query to answer the question. 

  	```sql
  	source <downloaded-location-of-scripts>/create_scoring_table.sql;
  	source <downloaded-location-of-scripts>/player_details_query.sql;
  	```

7. The Python script `mysql_python.py` calculates the coach's overall winning percentage. This script will query the coaches table from MySQL and calculate a coach's total games and total wins in the regular season. Then the coach's overall winning is calculated from their total games and total wins. The results are sorted by percentage of wins. This script was developed using Python 2.7. To run this script, update line 10 in the script with you MySQL username and password (MySQL server must be running).

	```python
	python <downloaded-location-of-scripts>/mysql_python.py
	```
