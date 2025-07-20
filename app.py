import os
from flask import Flask, request, render_template, redirect, url_for, flash
from pymongo import MongoClient
from dotenv import load_dotenv

load_dotenv()

MONGO_URI = os.getenv("MONGO_URI")
SECRET_KEY = os.getenv("SECRET_KEY")

app = Flask(__name__)
app.secret_key = SECRET_KEY

client = MongoClient(MONGO_URI)
db = client.get_database("fashionhub")
collection = db.customers

@app.route('/', methods=['GET', 'POST'])
def signup():
    if request.method == 'POST':
        name = request.form['name']
        email = request.form['email']
        password = request.form['password']

        if name and email and password:
            collection.insert_one({
                "name": name,
                "email": email,
                "password": password
            })
            flash("Signup successful!")
            return redirect(url_for('signup'))
        else:
            flash("Please fill all fields.")
    
    return render_template("signup.html")

if __name__ == "__main__":
    app.run(debug=True)
