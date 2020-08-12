from application import app
from flask import render_template, request
import requests
import random

@app.route('/race', methods=['GET'])
def race():
    list = ['Dragonborn','Dwarf','Elf','Gnome','Half-Elf','Halfling','Half-Orc','Human','Tiefling', 'Tadas']
    return list[random.randrange(9)]
