from flask import render_template
from app import app
from app.forms import LoginForm

@app.route('/')
@app.route('/index')
def index():
    user = {'username': 'Corey'}
    positions = [
        {
            'owner': {'username': 'Corey'},
            'symbol': 'AAPL'
        },
        {
            'owner': {'username': 'Justin'},
            'symbol': 'MO'
        }
    ]
    return render_template('index.html', title='Home', user=user, positions=positions)
@app.route('/login')
def login():
    form = LoginForm()
    return render_template('login.html', title='Sign In', form=form)
