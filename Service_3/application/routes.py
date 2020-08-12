from application import app
from flask import render_template, request
import requests
import random

@app.route('/dndclasses', methods=['GET'])
def dndclasses():
    list = ['Barbarian','Bard','Cleric','Druid','Fighter','Monk','Paladin','Ranger','Rogue','Sorcerer','Warlock','Wizard', 'William']
    return list[random.randrange(11)]
