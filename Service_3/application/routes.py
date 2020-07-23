from application import app
from flask import render_template, request
import requests
import random

@app.route('/classes', methods=['GET'])
def classes():
    list = ['Barbarian','Bard','Cleric','Druid','Fighter','Monk','Paladin','Ranger','Rogue','Sorcerer','Warlock','Wizard']
    return list[random.randrange(11)]
