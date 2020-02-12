# Draft_Machine
Applying machine learning to NBA Draft prospects
# 2020 NBA Draft Machine

* [General info](#general-info)
* [Technologies](#technologies)
* [Development Process](#development-process)

## General info

The purpose of this project is to provide the NBA with a model to predict those players 
who would not be good selections for the 2020 NCAA draft picks.  They are categrized as 'Bust', and it is predicted that they will not add any value to the future of the game.

## Technologies

### Languages Used

* Python
* CSS
* HTML
* SQL

### Data Extraction and Munging

* Jupyter notebook - version 4.1
* Pandas - version 0.23.4
* Numpy - version 1.15.4
* Sklearn - version 0.22.1
* Seaborn - version 0.10.0
* Matplotlib - Version 3.1.3


### Database

* Postgres - version 12.1

### Data Rendering and Visualization

* Flask - version 1.0.2
* Jinja2 - version 2.10
* Plotly - version 1.49.1
* HTML & CSS:
  * Modernizr - version 2.6.0
  * Foundation - version 4
* Qlik Sense
* Pickle in Python
* sportsreference 0.4.7

## Development Process

### Data Munging
To train our machine learning model, we needed to gather data about NBA players before they made it to the pros. To do this, we collected NBA player data between 2000 and 2019 from [https://www.basketball-reference.com/draft/NBA_2000.html]. We used pandas to merge and clean the NBA data, filtering to include only players that had a college listed. This list of players was used to extract NCAA data from the sportsreference API. The NBA and NCAA data were exported as csv files, and were also combined to one csv files. 2020 draft data was collected from [https://www.nbadraft.net/nba-mock-drafts/], and was filtered to exclude foreign players. We used this data to test our model. 


## Models

We tested sevaral models to obtain the best outcome for our project.  
These included:
* K - Nearest Neighbors
* Random Forest Classification
* Support Vector Machine (SVM)
* Neural Network 
* linear regression


### Pre-Processing Steps
For all of the models, the pre-processing steps are as follows: 
1. Import dependencies
2. Import NCAA_data.csv and create a dataframe
3. Drop columns to create a dataframe which displays key features that we want to analyze (key features were obtained through random forest feature_selection (see below)).
4. Use Label Encoder to encode the "class" column to integers
5. train_test_split the data
6. fit the data to the model
7. We created the GridSearch estimator along with a parameter object containing the values to adjust
8. We fit the model using the grid search estimator
9. We list the best parameters for this dataset
10. We listed the best score which was 0.774305555556
11. We made predictions with the hypertuned model
12. We finally calculated classification report

### Model Processes and Findings
* Random Forest


* Artificial Neural Network
Keras Sequential was the Artificial Neural Network model tested on the NBA player’s college data and 2020 Draft Prospects. Using the same six features recommended by the Random Forest model, players were categorized with the ‘player’ (good, worth drafting) and ‘bust’ (bad, not worth drafting) labels. With only a simple train/test split, model accuracy on testing sets was disappointing - hovering between the 50-70 percentage with huge variance. Using K-Fold Cross Validation (K-5), final model accuracy on test data jumped to around 85%. Unfortunately, model predictions on the 2020 Draft Prospects proved that the model is bugged when predicting – the ANN thought that there were no ‘busts’. This does not square with our convention knowledge that the 2020 Draft seems relatively weak compared to previous years, and that the average number of ‘busts’ for the previous years hovers around 30% of the draft.

* K-Nearest Neighbor
The K Nearest Neighbor Classifier model was used to analyze College basketball players and their suitability for being drafted to the NCAA. The model was selected so as to determine which players were categorized as a ‘Bust’ and would therefore not be fit to be drafted to the NCAA.
A number of variable were combined to validate the accuracy of the model and to come up with a finding that was workable. Some of the variables used included 'win_shares_per_40_minutes', 'field_goal_percentage', 'free_throw_attempt_rate', 'total_rebounds_per_40' as well as 'assists', 'blocks', 'turnovers', 'steals_per_40'.
In most of the combinations the highest value of K in the Train and Test output was ‘11’. Since we primarily wanted to predict the future of NCAA draft we wanted ensure that the prediction had a higher value. k: 11, Train/Test Score: 0.765/0.654.

* SVM
We used SVM (Support-Vector-Machine) model to analyze NCAA data to predict 2020 NBA draft using 6 features with “rbf” as value for kernel parameter.
X variable contains attributes such as field_goal_percentage, win_shares_per_40_minutes, true_shooting_percentage, free_throw_attempt_rate,
three_point_percentage, height while y variable was class. Once the data was divided into attributes and Label the final
preprocessing step is to train & test sets. Result for my test was Test Acc: 0.658879.




## Conclusion
Our final selection was Random Forest Classification.  This model offered the highest Train/Test predictions.

The following top six features were used to predict
[(0.19545382543171627, 'field_goal_percentage'),
 (0.18900679369069612, 'win_shares_per_40_minutes'),
 (0.1761453493565039, 'true_shooting_percentage'),
 (0.17068663302183093, 'free_throw_attempt_rate'),
 (0.16473951504779355, 'three_point_percentage'),
 (0.10396788345145934, 'height')]


## Instructions
* pip install sportsreference
## Resources
* [https://machinelearningmastery.com/save-load-machine-learning-models-python-scikit-learn/
* https://scikit-learn.org/stable/
