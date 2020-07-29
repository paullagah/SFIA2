from application import app
from flask import render_template, request
from flask_sqlalchemy import SQLAlchemy
import requests
import random


db = SQLAlchemy(app)

class dnd(db.Model):
    id = db.Column(db.Integer, primary_key=True, unique=True)
    races = db.Column(db.String(50), nullable=False)
    classes = db.Column(db.String(50), nullable=False)
   
    def __repr__(self):
    return ''.join(
        [
            'Race: ' + self.races + '\n' 
            'Classes ' + self.classes + '\n'
            'ID: ' + str(self.id) 
        ]
    )


@app.route('/', methods=['GET'])
def home():
    response = requests.get('http://service_4:5003/merge')
    print(response)
    sentence = response.text
    dnd_data = dnd.query.all()
    return render_template('index.html', sentence = sentence, dnd = dnd_data, title = 'Home')
