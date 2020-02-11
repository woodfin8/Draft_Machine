#!/usr/bin/env python
# coding: utf-8

# In[11]:


import pickle
from flask import Flask, jsonify, render_template, request


# In[12]:


app = Flask(__name__)


# In[17]:


# model = pickle.load(open('random_forest/model.pkl', 'rb'))


# In[19]:


#return homepage
@app.route("/")
def index():
    return render_template("index.html")


# In[ ]:


#get results from create player
@app.route('/predict', methods=['POST'])
def predict():

    name = request.form['player_name']

#     prediction = model.predict(final_features)

#     output = round(prediction[0], 2)

    return render_template('index.html', evaluation_text = name)

@app.route('/find')
def find():


#     prediction = model.predict(final_features)

#     output = round(prediction[0], 2)

    return render_template('find.html')

# In[ ]:


if __name__ == "__main__":
    app.run(debug=True)

