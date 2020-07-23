from application import app
from flask import render_template, request
import requests
import random

@app.route('/merge', methods=['GET'])
def merge():
    race = requests.get('http://localhost:5001/race')
    classes = requests.get('http://localhost:5001/classes')
    response = "Your race is " + race.text + " and your class is " + classes.text
    return response
