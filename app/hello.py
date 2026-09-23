from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello_world():
    return "<p>Wed Sep 23 22:23</p>"