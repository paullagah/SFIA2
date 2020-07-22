from application import app
from flask import render_template, request
import requests
import random

@app.route('/')
def hello_world():
    return 'Hello World!'
