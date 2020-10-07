from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, BooleanField, SelectField, SubmitField
from wtforms.validators import InputRequired, Email, Length

class LoginForm(FlaskForm):
    username = StringField('username', validators=[InputRequired(), Length(min=1, max=15)])
    password = PasswordField('password', validators=[InputRequired(), Length(min=4, max=80)])
    adminlogin=SubmitField("adminlogin")
    login = SubmitField("login")


class RegisterForm(FlaskForm):
    username = StringField('username', validators=[InputRequired(), Length(min=1, max=15)])
    password1 = PasswordField('password1', validators=[InputRequired(), Length(min=4, max=80)])
    password2 = PasswordField('password2', validators=[InputRequired(), Length(min=4, max=80)])
    register = SubmitField()

class ModifyForm(FlaskForm):
    username = StringField('username', validators=[InputRequired(), Length(min=1, max=15)])
    password1 = PasswordField('password1', validators=[InputRequired(), Length(min=4, max=80)])
    password2 = PasswordField('password2', validators=[InputRequired(), Length(min=4, max=80)])
    modify = SubmitField('modify')

class IndexForm(FlaskForm):
    Degree=[('','Select Degree'),('BE','BE'),('MBA','MBA'),('MTech','M.Tech'),('MSc','M.Sc'),('BCA','BCA'),('PhD','PhD')]
    degree=SelectField('Types of degree',choices=Degree)
    submit=SubmitField("Submit")

class BASICForm(FlaskForm):
    submit=SubmitField('Submit')

class USERLIST(FlaskForm):
    add=SubmitField("Add")
class STUDENTLIST(FlaskForm):
    add=SubmitField("Add")
