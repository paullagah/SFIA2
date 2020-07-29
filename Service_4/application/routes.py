from application import app
from flask import render_template, request
from flask_sqlalchemy import SQLAlchemy
import requests
import random

app.config['SECRET_KEY'] = '919c92fab903330df5b2f66c22d3b22b'  # environ.get('SECRET_KEY')
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://' + \
                                        environ.get('SQLHOST') + \
                                        ':' + \
                                        environ.get('PASSWORD') + \
                                        '@' + \
                                        environ.get('USER') + \
                                        ':' + \
                                        environ.get('PORT') + \
                                        '/' + \
                                        environ.get('DBNAME')

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
