from application import app
from flask import render_template, request
from flask_sqlalchemy import SQLAlchemy
from os import environ
import requests
import random

app.config['SECRET_KEY'] = '919c92fab903330df5b2f66c22d3b22b'  # environ.get('SECRET_KEY')
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://' + \
                                        environ.get('MYSQL_USER') + \
                                        ':' + \
                                        environ.get('MYSQL_PASSWORD') + \
                                        '@' + \
                                        environ.get('MYSQL_HOST') + \
                                        ':' + \
                                        environ.get('MYSQL_PORT') + \
                                        '/' + \
                                        environ.get('MYSQL_DB_NAME')

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
    dndclass = requests.get('http://service_3:5002/dndclasses')
    response = "Your race is " + str(race.text) + " and your class is " + str(dndclass.text)
    dnd_data = dnd(
            races=str(race),
            classes=str(dndclass)
        )
    db.session.add(dnd_data)
    db.session.commit()
    return response
