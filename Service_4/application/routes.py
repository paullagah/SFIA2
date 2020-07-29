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

@app.route('/merge', methods=['GET', 'POST'])
def merge():
    race = requests.get('http://service_2:5001/race')
    classes = requests.get('http://service_3:5002/classes')
    response = "Your race is " + race.text + " and your class is " + classes.text
    dnd_data = dnd(
            races=race
            classes=classes
        )
        db.session.add(dnd_data)
        db.session.commit()
    
    return response
