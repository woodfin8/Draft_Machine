# Draft_Machine

* [General info](#general-info)
* [Technologies](#technologies)
* [Development Process](#development-process)

## General info

How well can a basketball player's college performance predict their NBA potential? We look at players selected in the 2000-2018 NBA drafts and use machine learning classification models to answer this question. Players' NCAA stats were collected, filtered and used as model features. We looked at two possible NBA outcomes: "Player" - the drafted player turned out to be NBA caliber, playing for more than 2 years in the league, and "Bust" - The drafted player lasted 2 years or less in the leagues. 
In some cases, the "Bust" didn't play a single pro game. After fitting and testing the data with four different classifiers, we selected a Random Forest classifier as our model of choice. This model was then applied to top prospects for the upcoming 2020 NBA draft to see if this draft - as sbnation.com described it - "is one of the weakest in years". 


## Technologies

### Languages and Applications Used

* Python
* CSS
* HTML
* PostgreSQL
* QlikSense

### Data Extraction, Munging, and Modeling 

* Jupyter notebook - version 4.1
* Pandas - version 0.23.4
* Numpy - version 1.15.4
* Sklearn - version 0.22.1
* sportsreference - version 0.4.7
* keras - version 2.3.1

### Database

* PostgreSQL - version 12.1

### Data Rendering and Visualization

* Flask - version 1.0.2
* Jinja2 - version 2.10
* Pickle
* Matplotlib - Version 3.1.3
* Seaborn - version 0.10.0
* HTML & CSS:
  * Modernizr - version 2.6.0
  * Foundation - version 4
* Bootstrap - version 3.3.7
* QlikSense

## Development Process

### Data Munging
To train our machine learning model, we needed to gather data about drafted players before they made it to the pros. The steps to do this were:
1. Collect draft picks and their NBA player data between 2000 and 2019 from https://www.basketball-reference.com/draft/NBA_2000.html. 
2. Use pandas to merge and clean the NBA data, filtering to include only players that had played in the NCAA. 
3. Use this list of players to extract NCAA data from the sportsreference API (pip intall sportsreference in jupyter notebook). The NBA and NCAA data were exported as csv files, and were also combined to one csv files. 
4. Collect 2020 draft prospects were collected from https://www.nbadraft.net/nba-mock-drafts/, and filter to exclude foreign players. 

## Models

We trained and tested our data with the following classification models.   
* K - Nearest Neighbors
* Random Forest Classification
* Support Vector Machine (SVM)
* Artificial Neural Network 

### Pre-Processing Steps
For all of the models, the pre-processing steps are as follows: 
1. Import dependencies
2. Import NCAA_data.csv and create a dataframe
3. Drop columns to create a dataframe which displays key features that we want to analyze (key features were obtained through random forest feature_selection (see below)).
4. Use Label Encoder to encode the "class" column to integers
5. train_test_split the data
6. Fit the data to the model
7. Create GridSearch estimator along with a parameter object containing the hyper-parameters to adjust
8. Re-fit the model using the grid search estimator
9. List best hyper-parameters for this dataset
10. Lst the best score 
11. Make predictions with the hypertuned model
12. Produce classification report

### Model Processes and Findings

Based on correlation and feature importance findings, the following six NCAA stats were used as features:
* field_goal_percentage
* win_shares_per_40_minutes
* true_shooting_percentage
* free_throw_attempt_rate
* three_point_percentage
* height

#### Label Choices
Our intial aim was to rank players in 4 categories: "Star", "Above-average", "Below-average" and "Bust". However, the machine learning results were disappointing with 4 labels, giving us testing accuracy scores in the mid 30%'s. We decided to limit the labels to 2 outcomes: "Player" and "Bust" as drafting a first round "Bust" is something all NBA teams want to avoid.  

#### Random Forest (Chosen model)
The random forest model was trained using NBA player's college data. After testing and training the data in the model, random forest feature importance was used to determine the hierarchy of the features. This list helped us narrow our list of features to the 6 features that we used to train and test all of our models. Random forest was used again, limiting the features to the top 6. The random forest score was about 65%. The grid search was run multiple times, trying various n-estimators (the number of trees for the model) ranging from 50-300, using 200 as the final n-estimator. The result was a grid best score around 75%. The "Bust" class accuracy score ranged between 17-22%, and the "Player" class accuraccy score ranged between 74-77%. This model was run on the '2020_prospects.csv" to predice this year's draft outcome. The result was 7 out of 51 players, or 13.7%, were classified as “Bust”. In our NBA historical files, 28% of the players were classified as “Bust”. 

#### Artificial Neural Network
Keras Sequential was the Artificial Neural Network model tested on the NBA player’s college data and 2020 Draft Prospects. Using the same six features recommended by the Random Forest model, players were categorized.  With only a simple train/test split, model accuracy on testing sets was disappointing - hovering between the 50-70 percentage with huge variance. Using K-Fold Cross Validation (K-5), final model accuracy on test data jumped to around 85%. Unfortunately, model predictions on the 2020 Draft Prospects proved that the model is bugged when predicting – the ANN thought that there were no ‘busts’. This does not square with our conventionial knowledge that the 2020 Draft seems relatively weak compared to previous years, and that the average number of ‘busts’ for the previous years hovers around 30% of the draft. Thus, the Random Forest Classification model was our chosen model because it had much better reliablity in this situation.

#### K-Nearest Neighbor
The K Nearest Neighbor Classifier model was used to analyze College basketball players and their suitability for being drafted to the NCAA.  A number of variables were combined to validate the accuracy of the model and to come up with a finding that was workable. Some of the variables used included 'win_shares_per_40_minutes', 'field_goal_percentage', 'free_throw_attempt_rate', 'total_rebounds_per_40' as well as 'assists', 'blocks', 'turnovers', 'steals_per_40'. In most of the combinations the highest value of K in the Train and Test output was ‘11’. Test accuracy scores averaged in the mid 60%'s, thus we deferred to the Random Forest Model. 

#### SVM
Support-Vector-Machine (SVM) model was used to analyze NCAA data to predict 2020 NBA draft using 6 features with “rbf” as value for kernel parameter. X variable contains attributes such as field_goal_percentage, win_shares_per_40_minutes, true_shooting_percentage, free_throw_attempt_rate, three_point_percentage, height while y variable was class. Once the data was divided into attributes and Label the final preprocessing step is to train & test sets. Result for the tests hovered around 65%, similar to the KNN model.

#### Heatmap Feature Analysis
We used heatmap correlation displays to narrow our feature selection.
![Features_1](/images/features_vs_class.png)
![Features_2](/images/features_vs_class_2.png)
![Features_3](/images/top_features_vs_class.png)

### 2020 Draft Busts Analysis
Our random forest model classified 7 of the top 51 college prospects as NBA "Busts". At a 13% "Bust" rate, this is less than the historical average of 28%. However, 4 of those players are in the top 11 draft prospects. This suggests that this is indeed a weak draft class and/or that General Managers should look futher down the prospect list when they make their picks in Jun3 2020.  

Why did our model assign a "Bust" label to seven Draft prospects? Here's what our model didn't like about each player:

![2020_Draft_Avg](/images/busts_avgs.PNG)
![2020_Draft_Table](/images/busts_table.PNG)

Player: James Wiseman   
NBADraft.net Rank: 2
Model Prediction: Bust
James Wiseman, one of the tallest players in the draft at has a 0% three-point percentage. In an era where big players are shooting more and more threes, our model sees this lack of an outside shot as a Pro pitfall

Player: Nico Mannion
NBADraft.net Rank: 6
Model Prediction: Bust
Nico Mannion's low field goal percentage and low true shooting percentage (both in the bottom quartile of 2020 prospects) consigned him to the Bust Bin. 

Player: Cole Anthony
NBADraft.net Rank: 9
Model Prediction: Bust
Cole Anthony's abysmal field goal shooting (the lowest of all 2020 Draft prospects) dooms him to the Bust category. 

Player: Tyrese Haliburton
NBADraft.net Rank: 11
Model Prediction: Bust
Tyrese Haliburton just can't get to the free throw line. With the lowest free throw attempt rate of any draft prospect, Tyrese gets labeled a Bust by our model. 

Player: Elijah Hughes
NBADraft.net Rank: 37
Model Prediction: Bust
Elijah Hughes' low field goal percentage and low win-shares per 40 minutes hurt him in the eyes of our model

Player: Malachi Flynn
NBADraft.net Rank: 43
Model Prediction: Bust
Malachi Flynn's Pro chances are hurt by his low field goal percentage, low free throw attempt rate and low win-shares per 40 minutes

Player: Cam Mack
NBADraft.net Rank: 60
Model Prediction: Bust
It's only fitting that the player picked to go last by NBADraft.net is a Bust according to our model. His low win shares hurts his ranking. 

## Try the Model Yourself!
On our homepage, create and evaluate your own player. Select the players college stats in the web form and submit to see what our model thinks of your player's NBA prospects

## Authors
* Keith Woodfin (woodfin8)
* Jacqueline McBean-Blake (jacquiemcb)
* Melissa Mason (MelMason)
* Pournima (Pournima07)
* Brendan Law (M1Bren)
Billy Martinez (bmatz0729)

## Resources
* https://machinelearningmastery.com/
* https://scikit-learn.org/stable/
* https://pypi.org/project/sportsreference/
* https://www.nbadraft.net/nba-mock-drafts/
* https://www.basketball-reference.com/draft/NBA_2019.html
