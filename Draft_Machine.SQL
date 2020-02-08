CREATE TABLE NBA (
Win_Shares 			float,
Min_PPG 			float,
Player 				varchar(30),
Games 				int,
Year 				int,
Rank 				int,
Point_PG 			float,
WS_48 				float,
BOX 				float,
Val_Overall_Replacement_Player 	float,
Team 				varchar(10),
College 			varchar(60),
Years 				int,
Mins_Played  			int,
Total_PT  			int,
Class  				varchar(30),
player_id 			varchar(100) NOT NULL UNIQUE,
CONSTRAINT pk_NBA PRIMARY KEY (
    player_id
     )
);




/*________________________________________________________*/

CREATE TABLE NCAA (
player_id 			varchar(100) NOT NULL UNIQUE,
name 					varchar(60),
class 					varchar(60),
college 				varchar(60),
assists					float,
blocks 					int,
effective_field_goal_percentage 	float,
field_goal_percentage 			float,
free_throw_attempt_rate			float,
free_throw_percentage 			float,
games_played 				int,
height_in_inches 			int,
minutes_played 				float,
points 					int,
steals 					int,
three_point_percentage 			float,
three_pointers 				float,
total_rebounds 				int,
true_shooting_percentage 		float,
turnover_percentage 			float,
turnovers				float,
win_share_per_40_minutes		float,
assist_per_40				float,
blocks_per_40 				float,
points_per_40 				float,
steals_per_40 				float,
three_pointers_per_40 			float,
total_rebounds_per_40 			float,
turnovers_per_40 			float,
CONSTRAINT pk_NCAA PRIMARY KEY (
    player_id
     )
);