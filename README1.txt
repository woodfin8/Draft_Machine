# 2020 NBA Draft Machine

* [General info](#general-info)
* [Technologies](#technologies)
* [Development Process](#development-process)

## General info

The purpose of this project is to provide the NCAA with an model to predict those players 
who would not be good selections for the 2020 NCAA draft picks.  They are categrized as 'Bust', and it is 
predicted that they will not add any value to the future of the game.

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

## Development Process

### Data Extraction

## Models
We tried sevaral models in order to obtain the best outcome for our project.  These included
* K - Nearest Neighbors
* Random Forest Classification
* Support Vector Machine (SVM)
* Neural Network 

Our final selection was Random Forest Classification.  This model offered the highest Train/Test predictions.  
In order to come to a final analysis the following steps were taken
1. We imported the csv file NCAA.csv
2. We dropped some columns
3. We trained the model
4. We created the GridSearch estimator along with a parameter object containing the values to adjust
  the GridSearch estimator along with a parameter object containing the values to adjust
5. We fit the model using the grid search estimator
6. We list the best parameters for this dataset
7. We listed the best score which was 0.774305555556
8. We made predictions with the hypertuned model
9. We finally calculated classification report

The following top six features were used to predict
[(0.19545382543171627, 'field_goal_percentage'),
 (0.18900679369069612, 'win_shares_per_40_minutes'),
 (0.1761453493565039, 'true_shooting_percentage'),
 (0.17068663302183093, 'free_throw_attempt_rate'),
 (0.16473951504779355, 'three_point_percentage'),
 (0.10396788345145934, 'height')]

## Resources
* [https://machinelearningmastery.com/save-load-machine-learning-models-python-scikit-learn/
* https://scikit-learn.org/stable/

 
