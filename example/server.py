"""This is the Flask server. This is run in development, but not in production.
The wsgi.py file is what is used to set up uwsgi in production."""

from flask import Flask
app = Flask(__name__)


@app.route("/")
def hello():
    return "<h1 style='color:blue'>Hello There!</h1>"


if __name__ == "__main__":
    app.run(host='0.0.0.0')
