from flask import Flask, request, render_template, url_for, flash, session,redirect,jsonify,json, send_file,send_from_directory
import pymysql,sys,datetime,os
import jinja2
import json
from functions import *
from forms import *
from werkzeug.security import generate_password_hash, check_password_hash
from Workbook import allstudentdata

env="global"
if env=="local":
    HOST = 'localhost'                                            #Connect to db
    USER = 'root'
    PASSWORD = 'venku@123456A'
    DATABASE = 'lccsjce'
else:
    HOST = 'sql12.freemysqlhosting.net'                                            #Connect to db
    USER = 'sql12369762'
    PASSWORD = 'ExmRAQ7DPf'
    DATABASE = 'sql12369762'

db = pymysql.connect(host=HOST,user=USER,password=PASSWORD,db=DATABASE)
                            
if db.open:
    print("Connection established to database successfully")
else:
    print("Connection failed")
    sys.exit('Database connection error')
    

app = Flask(__name__)
app.config['SECRET_KEY'] = 'LCCSJCE'
app.config['Excel']="static/excel"

          
def listofusers():    
    users = [(0,'Admin','1234')]                      #Get list of users
    cursor = db.cursor()
    cursor.execute('SELECT id,username,password FROM user_details')
    users_data = cursor.fetchall()
    cursor.close()
    for user in users_data:
        users.append(user)
    return users
    


def getcols(tablename):
    cursor=db.cursor()
    #cursor.execute("SELECT `COLUMN_NAME` FROM `INFORMATION_SCHEMA`.`COLUMNS` WHERE `TABLE_SCHEMA`='lccsjce' AND `TABLE_NAME`='student_details'")
    cursor.execute("SHOW COLUMNS FROM "+ tablename)
    column_list=list(cursor.fetchall())
    for i in range(len(column_list)):
        column_list[i]=column_list[i][0]
    return column_list

def checkduplicate(res,state,id):
    cursor=db.cursor()
    x=False
        #check for duplicate
    checkanumber=str(dict(res)['stu_admissionnumber'])
    cursor.execute("Select stu_admissionnumber from student_details where stu_admissionnumber=%s",checkanumber)
    p=cursor.fetchall()
    if(state=='modify'):
        cursor.execute("Select stu_admissionnumber from student_details where stu_id=%s",(str(id)))
        adnumber=str(cursor.fetchone()[0])
        if(checkanumber==adnumber):
            return False
        
        if((len(p)>=1)):
            cursor.close()
            return True
        else:
            x=False
    else:
        if(len(p)>0):
            print(p)
            cursor.close()
            return True
    cursor.close()
    return x


def insertquery(tbname,columns,vals):
    query='''INSERT INTO ''' +tbname+tuplestring(columns)+''' VALUES '''+perstring(vals)
    try:
        cur=db.cursor()
        cur.execute(query,vals)
        cur.close()
        print("Successfully inserted")
    except Exception as e:
        print("Error inserting in db")
        print(e)
        exit

def alterquery(tbname,columns,vals,colcheck,anumber):
    query='''UPDATE '''+tbname+''' SET '''+updatestring(columns)+''' WHERE '''+colcheck+'''='''+anumber
    try:
        cur=db.cursor()
        
        cur.execute(query,vals)
        db.commit()
        cur.close
        print("Successfully updated "+tbname)
    except Exception as e:
        print("Error inserting in "+tbname)
        print(e)
        exit

def deletequery(tbname,colcheck,checkid):
    query='''DELETE FROM '''+tbname+''' WHERE '''+colcheck+'''='''+checkid+''''''
    try:
        cur=db.cursor()
        cur.execute(query)
        db.commit()
        cur.close()
        print("Successfully deleted row in  "+tbname)
    except Exception as e:
        print("Error deleting in "+tbname)
        print(e)
        exit
def selectquery(tbname,colcheck,checkid):
    if(type(colcheck)==type("string")):
        query='''SELECT * FROM '''+tbname+''' WHERE '''+colcheck+'''='''+checkid
    else:
        query='''SELECT * FROM '''+tbname+''' WHERE '''+multiselectstring(colcheck,checkid)
    selected=1
    try:
        cur=db.cursor()
        cur.execute(query)
        selected=list(cur.fetchall())
        cur.close()

    except Exception as e:

        print("Error selecting from "+tbname)
        print(e)
        exit

    return list(selected[0])
def getresulttype(adnumber,degree):
    cur=db.cursor()
    cur.execute("SELECT deg_resulttype from deg_details where stu_admissionnumber=%s and deg_degree=%s ",(adnumber,degree))
    result=list(cur.fetchone())
    cur.close()
    return result[0]
    
def formdetails():
    formlist=[]
    with open('data.txt','r') as filehandle:
        for line in filehandle:
            changer=line[:-1]
            formlist.append(changer)
    formlist=formlist[:-1]
    return formlist
def checkput(res):
    sdcols=getcols('student_details')[1:]
    columns=list(res.keys())
    '''with open('data.txt','w+') as filehandle:
        for col in columns:
            filehandle.write('%s\n'%col)'''
    vals=list(res.values())
    adnumber=vals[columns.index('stu_admissionnumber')]
    try:
        changer=sdcols.index('stu_guardian')+1
        insertquery('student_details',sdcols,vals[:changer]+vals[columns.index('stu_degree'):columns.index('stu_entrance')+1]+[vals[columns.index('stu_bank')]]+vals[columns.index('pa_house'):columns.index('stu_local')+1]+[vals[columns.index('stu_puord')]]+[vals[columns.index('puc_resulttype')]]+[vals[columns.index('puc_stream')]])
        
        #insert guardian details
        changer=[adnumber]+vals[columns.index('gu_title'):columns.index('gu_income')+1]
        insertquery('guardian_details',getcols('guardian_details')[1:],changer)

        #insert entrance test details
        changer=[adnumber]+vals[columns.index('et_name'):columns.index('et_ordernumber')+1]
        insertquery('entrance_test',getcols('entrance_test')[1:],changer)

        #insert bank details
        changer=[adnumber]+vals[columns.index('bd_name'):columns.index('bd_ifsc')+1]
        insertquery('bank_details',getcols('bank_details')[1:],changer)

        #insert local address
        if(vals[columns.index('stu_local')]=="Yes"):
            changer=[adnumber]+vals[columns.index('pa_house'):columns.index('pa_taluk')+1]
            insertquery('local_address',getcols('local_address')[1:],changer)
        else:
            changer=[adnumber]+vals[columns.index('la_house'):columns.index('la_taluk')+1]
            insertquery('local_address',getcols('local_address')[1:],changer)
        
        #insert x address details
        changer=[adnumber]+['x']+vals[columns.index('x_institution'):columns.index('x_city')+1]
        insertquery('basicaddress_details',getcols('basicaddress_details')[1:],changer)

        #insert x marks details
        changer=[adnumber]+['x']+['']+['']+[vals[columns.index('x_resulttype')]]+vals[columns.index('x_obtainedmarks'):columns.index('x_cgpa')+1]
        insertquery('deg_details',getcols('deg_details')[1:],changer)

        def deginput(deg):
            #insert diploma address details
            changer=[adnumber]+[deg]+vals[columns.index(deg+'_institution'):columns.index(deg+'_city')+1]
            insertquery('basicaddress_details',getcols('basicaddress_details')[1:],changer)
            #insert diploma marks details
            changer=[adnumber]+[deg]+['']+['overall']+[vals[columns.index(deg+'_resulttype')]]+vals[columns.index(deg+"_obtainedmarks"):columns.index(deg+'_overallpercentage')+1]+[vals[columns.index(deg+'_obtainedgrade')]]+[vals[columns.index(deg+'_totalgrade')]]+[vals[columns.index(deg+'_cgpa')]]
            insertquery('deg_details',getcols('deg_details')[1:],changer)  
            '''w=vals[columns.index(deg+'_wise')][0]
            rt=vals[columns.index(deg+'_resulttype')][0]
            #make if loop when the blocknumbers have been implemented
            
            if(rt=='m'):
                li=vals[columns.index(deg+'_'+rt+w+'obtainedmarks'):columns.index(deg+'_'+rt+w+'totalmarks')+1]+['','','','']
            elif(rt=='g'):
                li=['','','']+vals[columns.index(deg+'_'+rt+w+'obtainedgrade'):columns.index(deg+'_'+rt+w+'totalgrade')+1]+['']
            else:
                li=['','','','','']+[vals[columns.index(deg+'_'+rt+w+'cgpa')]]
            changer=[adnumber]+[deg]+[vals[columns.index(deg+'_wise')]]+[vals[columns.index(deg+'_'+rt+w+'year')]]+[vals[columns.index(deg+'_resulttype')]]+li
            insertquery('deg_details',getcols('deg_details')[1:],changer)'''

        if(vals[columns.index('stu_puord')]=="puc"):
            #insert puc address details
            changer=[adnumber]+['puc']+vals[columns.index('puc_institution'):columns.index('puc_city')+1]
            insertquery('basicaddress_details',getcols('basicaddress_details')[1:],changer)
            #insert puc marks details
            changer=[adnumber]+['puc']+['']+['overall']+[vals[columns.index('puc_resulttype')]]+vals[columns.index("puc_obtainedmarks"):columns.index('puc_overallpercentage')+1]
            insertquery('deg_details',getcols('deg_details')[1:9],changer)           
            for subject in ['physics','chemistry','mathematics','bussiness','philosophy']:
                changer=[adnumber]+['puc']+['']+[subject]+[vals[columns.index('puc_resulttype')]]+vals[columns.index("puc_"+subject+"_obtainedmarks"):columns.index('puc_'+subject+'_totalmarks')+1]
                insertquery('deg_details',getcols('deg_details')[1:8],changer)

        else:
            deginput('dip')
    
        if(res['stu_degree'][0]!="B"):
            
            deginput('ug')
            if(res['stu_degree'][0]!="M"):
                deginput('pg')
    except Exception as e:
        print(e)
        return False
    return True
    
def listofstudents():
    stulist=[]
    cols=getcols('student_details')
    #formlist=formdetails()
    stream=[]
    pucresulttype=[]


    query="SELECT * FROM student_details"
    try:
        cursor=db.cursor()
        cursor.execute(query)
        changer=cursor.fetchall()
        cursor.close()
        for stu in changer:
            stream.append(stu[-1])
            pucresulttype.append(stu[-2])
            stulist.append(list(stu[:-2]))

        for i in range(len(stulist)):
            adnumber=stulist[i][cols.index('stu_admissionnumber')]
            puord=stulist[i][cols.index('stu_puord')]
            degree=stulist[i][cols.index('stu_degree')]
            
            #insert guardian details
            insert=selectquery('guardian_details','stu_admissionnumber',adnumber)[2:]
            
            ind=cols.index('stu_guardian')+1
            count=len(insert)
            stulist[i][ind:ind]=insert

            #insert entrance details
            insert=selectquery('entrance_test','stu_admissionnumber',adnumber)[2:]
            ind=cols.index('stu_entrance')+1+count
            count+=len(insert)
            stulist[i][ind:ind]=insert

            #insert bank details
            insert=selectquery('bank_details','stu_admissionnumber',adnumber)[2:]
            ind=cols.index('stu_bank')+1+count
            count+=len(insert)
            stulist[i][ind:ind]=insert

            #insert local details
            insert=selectquery('local_address','stu_admissionnumber',adnumber)[2:]
            ind=cols.index('stu_local')+1+count
            count+=len(insert)
            stulist[i][ind:ind]=insert

            def basicaddress(degname,befcol,count):
                insert=selectquery('basicaddress_details',['stu_admissionnumber','ad_degree'],[adnumber,degname])[3:]
                if(befcol=='end'):
                    ind=len(stulist[i])
                else:
                    ind=cols.index(befcol)+count
                count+=len(insert)
                stulist[i][ind:ind]=insert
                return count

            def degdetails(degname,befcol,count):
                insert=selectquery('deg_details',['stu_admissionnumber','deg_degree'],[adnumber,degname])[3:]
                if(degname=='x'):
                    insert=insert[2:]
                if(befcol=='end'):
                    ind=len(stulist[i])
                else:
                    ind=cols.index(befcol)+count
                count+=len(insert)
                stulist[i][ind:ind]=insert
                return count

            #insert X address details
            count=basicaddress('x','stu_puord',count)

            #insert X academic details
            count=degdetails('x','stu_puord',count)
            if(puord=='puc'):
                #insert puc address details
                count=basicaddress('puc','end',count)

                #insert puc academic details
                insert=[pucresulttype[i]]+selectquery('deg_details',['stu_admissionnumber','deg_degree','deg_terms'],[adnumber,'puc','overall'])[6:9]+[stream[i]]
                ind=len(stulist[i])
                count+=len(insert)
                stulist[i][ind:ind]=insert
                for subject in ['physics','chemistry','mathematics','bussiness','philosophy']:
                    insert=selectquery('deg_details',['stu_admissionnumber','deg_degree','deg_terms'],[adnumber,'puc',subject])[6:8]
                    ind=len(stulist[i])
                    count+=len(insert)
                    stulist[i][ind:ind]=insert
                #blank for diploma
                insert=['']*19
                ind=len(stulist[i])
                count+=len(insert)
                stulist[i][ind:ind]=insert
                
            else:
                #blank for puc
                insert=['']*27
                ind=len(stulist[i])
                count+=len(insert)
                stulist[i][ind:ind]=insert

                #insert diploma address details
                count=basicaddress('dip','end',count)

                #insert diploma academic details
                insert=[getresulttype(adnumber,'dip')]+selectquery('deg_details',['stu_admissionnumber','deg_degree','deg_terms'],[adnumber,'dip','overall'])[6:]
                ind=len(stulist[i])
                count+=len(insert)
                stulist[i][ind:ind]=insert
                
            if(degree[0]!='B'):
                #insert ug details
                #insert ug address details
                count=basicaddress('ug','end',count)

                #insert ug academic details
                insert=[getresulttype(adnumber,'ug')]+selectquery('deg_details',['stu_admissionnumber','deg_degree','deg_terms'],[adnumber,'ug','overall'])[6:]
                ind=len(stulist[i])
                count+=len(insert)
                stulist[i][ind:ind]=insert

                if(degree[0]!='M'):
                    #insert pg details
                    #insert pg address details
                    count=basicaddress('pg','end',count)

                    #insert pg academic details
                    insert=[getresulttype(adnumber,'pg')]+selectquery('deg_details',['stu_admissionnumber','deg_degree','deg_terms'],[adnumber,'pg','overall'])[6:]
                    ind=len(stulist[i])
                    count+=len(insert)
                    stulist[i][ind:ind]=insert
                else:
                    insert=['']*19
                    ind=len(stulist[i])
                    count+=len(insert)
                    stulist[i][ind:ind]=insert
            else:
                insert=['']*38
                ind=len(stulist[i])
                count+=len(insert)
                stulist[i][ind:ind]=insert
    except Exception as e:
        print("Error in retrieving the details")
        print(e)
        exit
    return stulist

def deleterow(tbname,colcheck,checkid):
    query='''DELETE FROM '''+tbname+''' WHERE '''+colcheck+'''='''+checkid+''''''
    try:
        cur=db.cursor()
        cur.execute(query)
        cur.close()
        print("Successfully deleted row in  "+tbname)
    except Exception as e:
        print("Error deleting in "+tbname)
        print(e)
        exit


#Routes begin
@app.route('/')
def hello():
    return redirect(url_for('login'))

@app.route('/loginpage', methods=['GET', 'POST'])
def login():
    form=LoginForm()
    if request.method == 'POST':
        if form.validate()==0:
            if(form.adminlogin.data):
                users=listofusers()
                if(users[0][1]==form.username.data and users[0][2]==form.password.data):
                            session['Admin']=True
                            session['loggedin'] = True
                            session['username'] = 'Admin'
                            flash("Login successful!!","success")
                            print(session)
                            return  redirect(url_for('adminhomepage'))
                else:
                    flash("Invalid username or password", "danger")
            else:
                with db.cursor() as conn:
                    conn.execute('SELECT * FROM user_details WHERE username = %s', (form.username.data))
                    user = conn.fetchone()
                if user:
                    if (user[2]==form.password.data):
                        session['loggedin'] = True
                        session['id'] = user[0]
                        session['username'] = user[1]
                        print(session)
                        flash("Login successful!!","success")
                        return redirect(url_for('index'))
                    else:
                        flash("Invalid username or password", "danger")
                else:
                    flash("Invalid username or password", "danger")
    if('loggedin' in session):
        return redirect(url_for('logout'))
    return render_template('loginpage.html', form=form,register=url_for('register')) 

@app.route('/logout')
def logout():
    session.clear()
    flash("You have been logged out","info")
    return redirect(url_for('login'))

@app.route('/register', methods = ['GET','POST'])
def register():
    form=RegisterForm()
    if request.method=="POST":
        if form.validate()==0: 
            users=listofusers()
            sql_query = '''INSERT 
                                INTO 
                                user_details 
                                (username,password) values
                                (%s,%s)
                '''
            if(form.password1.data!=form.password2.data):
                flash("The passwords don't match.Please Enter the same password","danger")
                return redirect(url_for('register'))
            if(form.username.data in list(users[i][1] for i in range(len(users[1:]))) ):
                flash("Username Already Present","danger")
                return redirect(url_for('register'))
            try:
                cursor = db.cursor()
                cursor.execute(sql_query,(form.username.data,form.password1.data))
                cursor.close()
                db.commit()
            except Exception as e:
                db.rollback()
                print("Error while inserting into the table",e)
            else:
                print('Stored Successfully')
                if(session.get("Admin")):
                    flash("Successfully Added User","success")
                    return redirect(url_for('userlist'))
                flash("Successfully registered.Please Login","success")
                return redirect(url_for('login'))
    return render_template('register.html',form=form)

@app.route('/adminhomepage',methods=['GET','POST'])
def adminhomepage():
    if not session.get('Admin'):
        return redirect(url_for('login'))
    if request.method=="POST":
        if('userlist' in request.form):
            return redirect(url_for('userlist'))
        else:
            return redirect(url_for('studentlist'))
    return render_template('adminhomepage.html',back=url_for('logout'),logout=url_for('logout'))

@app.route('/modify',methods=['GET','POST'])
def modify():
    if not session.get('Admin'):
        return redirect(url_for('login'))
    form=ModifyForm()
    userid=session['modifyid']
    user=selectquery('user_details','id',userid)
    if request.method=="POST":
        if form.modify.data:
            if(form.password1.data!=form.password2.data):
                flash("The passwords don't match.Please Enter the same password","danger")
                return redirect(url_for('modify'))
            li=[str(form.password1.data)]
            alterquery('user_details',['password'],li,'id',str(userid))
            session.pop('modifyid',None)
            return redirect(url_for('userlist'))

    return render_template('modify.html',form=form,username=user[1],back=url_for('userlist'),logout=url_for('logout'))

@app.route('/userlist',methods=['GET','POST'])
def userlist():
    if not session.get('Admin'):
        return redirect(url_for('login'))
    users=listofusers()
    form=USERLIST()
    if request.method=='POST':   
        if form.is_submitted():
            if('add' in request.form):
                return redirect(url_for('register'))
            elif('modify' in request.form):
                session['modifyid']=request.form['modify']
                print(session)
                return redirect(url_for('modify'))
            else:
                userid=request.form['Delete']
                deletequery('user_details','id',userid)
                return redirect(url_for('userlist'))
    return render_template('userlist.html',form=form,user_list=users[1:],back=url_for('adminhomepage'),logout=url_for('logout'))

@app.route('/studentlist',methods=['GET','POST'])
def studentlist():
    if not session.get('Admin'):
        return redirect(url_for('login'))
    session['submitted']='no'
    session.pop('studentmodifydata',None)
    session.pop('degree',None)
    query="Select stu_id,stu_name,stu_admissionnumber,stu_degree from student_details"
    cursor=db.cursor()
    cursor.execute(query)
    student_list=list(cursor.fetchall())
    cursor.close()
    '''with open('putter.txt','w+') as filehandle:
        for stu in students:
                filehandle.write('%s\n'% stu)'''
    '''for stu in students:
        student_list.append([stu[0],stu[1],stu[58],stu[41]])
    '''
    form=STUDENTLIST()
    if request.method=='POST':   
        if form.is_submitted():
            if('add' in request.form):
                return redirect(url_for('index'))
            elif('modify' in request.form):
                print(request.form['modify'][1])
                studentid=request.form['modify'][1:]
                studentid=int(studentid[:studentid.index(',')])
                degree=str(request.form['modify'][0:])
                degree=degree[degree.index(',')+1:degree.index(']')]
                session['studentmodifydata']=studentid
                session['degree']=degree
                '''for stu in students:
                    if str(stu[0])==str(studentid):
                        vals=stu[1:]
                        cols=formdetails()
                        finaldata=dict(zip(cols,vals))
                        print(finaldata)
                        break'''
                if(degree[0]=='B'):
                    return redirect(url_for('BATCH',degree=degree,studentid=studentid))
                elif(degree[0]=='M'):
                    return redirect(url_for('MASTER',degree=degree,studentid=studentid))
                else:
                    return redirect(url_for('POSTER',degree=degree,studentid=studentid))
            elif('download' in request.form):
                allstudentdata(formdetails(),listofstudents())
                try:
                    return send_from_directory(app.config["Excel"], filename="data.xlsx", as_attachment=True)
                except FileNotFoundError:
                    print("hello")
                    #abort(404)
            else:
                studentid=request.form['Delete']
                deletequery('student_details','stu_id',studentid)
                return redirect(url_for('studentlist'))

    return render_template('studentlist.html',student_list=student_list,back=url_for('adminhomepage'),logout=url_for('logout'))

@app.route('/index',methods=['GET','POST'])
def index():
    if not session.get('loggedin'):
        return redirect(url_for('login'))
    session['submitted']='no'
    back=url_for('logout')
    logout=url_for('logout')
    if('Admin' in session):
        back=url_for('studentlist')
    form = IndexForm()
    if request.method=='POST':
        if form.validate()==0:
            session['degree']=form.degree.data
            degree=form.degree.data
            print(degree)
            if(degree in ["BE","BCA"]):
                return redirect(url_for('BATCH',degree=degree))
            elif(degree in ["MTech","MBA","MSc"]):
                return redirect(url_for('MASTER',degree=degree))
            else:
                return redirect(url_for('POSTER',degree=degree))
    return render_template('index.html',form=form,back=back,logout=logout)


@app.route('/BATCH',methods=['GET','POST'])
@app.route('/BATCH/<degree>',methods=['GET','POST'])
@app.route('/BATCH/<degree>/<studentid>',methods=['GET','POST'])
def BATCH(degree=None,studentid=None):
    student_list=None
    if(degree is not None):
        session['degree']=degree
    id=0
    flag=0
    adnumber=1
    if (degree!=None) and ('Admin' in session) and ('studentmodifydata' in session) :
        students=listofstudents()
        
        for stu in students:
            if str(stu[0])==str(studentid):
                adnumber=stu[58]
                vals=stu[1:]
                cols=formdetails()
                student_list=dict(zip(cols,vals))
                break
    if not session.get('loggedin'):
        return redirect(url_for('login'))
    back=url_for('index')
    if('studentmodifydata' in session):
        back=url_for('studentlist')
    logout=url_for('logout')
    form=BASICForm()
    if request.method=="POST":
        if form.is_submitted:
            res=request.form
            if('studentmodifydata' in session):
                id=checkduplicate(res,'modify',studentid)
                if(id==True):
                    flash("Please change the Admission Number.It already has been assigned.","danger")
                else:
                    id=studentid
                    deleterow('student_details','stu_id',id)
                    flag=1
            else:
                if(checkduplicate(res,'add',studentid)):
                    print(session)
                    flash("Please change the Admission Number.It already has been assigned.","danger")
                else:
                    flag=1
            if(flag==1):
                flag=0
                status=checkput(res)
                if(status==True):
                    db.commit()
                    session['submitted']='yes'
                    
                    render_template('batchnew.html',student_list=student_list,degree=degree,form=form,back=back,logout=logout)
                    session.pop('degree',None)
                    print(session)
                    if('Admin' not in session):
                        
                        flash("Successfully Added Student","success")
                        return redirect(url_for('index'))
                    else:
                        if('studentmodifydata' in session):
                            string="Successfully Modified Student Detail"
                            flash(string,"success")
                            return redirect(url_for('studentlist'))
                        else:
                            flash("Successfully Added Student","success")
                            return redirect(url_for('studentlist'))
                else:
                    db.rollback()
                    
                    flash("Error in Inserting the details.Please try Again","danger")
    return render_template('batchnew.html',student_list=student_list,degree=degree,form=form,back=back,logout=logout)

@app.route('/MASTER',methods=['GET','POST'])
@app.route('/MASTER/<degree>',methods=['GET','POST'])
@app.route('/MASTER/<degree>/<studentid>',methods=['GET','POST'])
def MASTER(degree=None,studentid=None):
    student_list=None
    id=0
    flag=0
    adnumber=1
    if (degree!=None) and ('Admin' in session) and ('studentmodifydata' in session) :
        students=listofstudents()
        
        for stu in students:
            if str(stu[0])==str(studentid):
                adnumber=stu[58]
                vals=stu[1:]
                cols=formdetails()
                student_list=dict(zip(cols,vals))
                break
    if not session.get('loggedin'):
        return redirect(url_for('login'))
    back=url_for('index')
    if('studentmodifydata' in session):
        back=url_for('studentlist')
    logout=url_for('logout')
    form=BASICForm()
    if request.method=="POST":
        if form.is_submitted:
            res=request.form
            if('studentmodifydata' in session):
                id=checkduplicate(res,'modify',studentid)
                if(id==True):
                    flash("Please change the Admission Number.It already has been assigned.","danger")
                else:
                    id=studentid
                    deleterow('student_details','stu_id',id)
                    flag=1
            else:
                if(checkduplicate(res,'add',studentid)):
                    print(session)
                    flash("Please change the Admission Number.It already has been assigned.","danger")
                else:
                    flag=1
            if(flag==1):
                flag=0
                status=checkput(res)
                if(status==True):
                    db.commit()
                    session['submitted']='yes'
                    render_template('master.html',student_list=student_list,degree=degree,form=form,back=back,logout=logout)
                    session.pop('degree',None)
                    print(session)
                    if('Admin' not in session):
                        
                        flash("Successfully Added Student","success")
                        return redirect(url_for('index'))
                    else:
                        if('studentmodifydata' in session):
                            string="Successfully Modified Student Detail"
                            flash(string,"success")
                            return redirect(url_for('studentlist'))
                        else:
                            flash("Successfully Added Student","success")
                            return redirect(url_for('studentlist'))
                else:
                    db.rollback()
                    
                    flash("Error in Inserting the details.Please try Again","danger")
    return render_template('master.html',student_list=student_list,degree=degree,form=form,back=back,logout=logout)

@app.route('/POSTER',methods=['GET','POST'])
@app.route('/POSTER/<degree>',methods=['GET','POST'])
@app.route('/POSTER/<degree>/<studentid>',methods=['GET','POST'])
def POSTER(degree=None,studentid=None):
    student_list=None
    id=0
    flag=0
    adnumber=1
    if (degree!=None) and ('Admin' in session) and ('studentmodifydata' in session) :
        students=listofstudents()
        
        for stu in students:
            if str(stu[0])==str(studentid):
                adnumber=stu[58]
                vals=stu[1:]
                cols=formdetails()
                student_list=dict(zip(cols,vals))
                break
    if not session.get('loggedin'):
        return redirect(url_for('login'))
    back=url_for('index')
    if('studentmodifydata' in session):
        back=url_for('studentlist')
    logout=url_for('logout')
    form=BASICForm()
    if request.method=="POST":
        if form.is_submitted:
            res=request.form
            if('studentmodifydata' in session):
                id=checkduplicate(res,'modify',studentid)
                if(id==True):
                    flash("Please change the Admission Number.It already has been assigned.","danger")
                else:
                    id=studentid
                    deleterow('student_details','stu_id',id)
                    flag=1
            else:
                if(checkduplicate(res,'add',studentid)):
                    print(session)
                    flash("Please change the Admission Number.It already has been assigned.","danger")
                else:
                    flag=1
            if(flag==1):
                flag=0
                status=checkput(res)
                if(status==True):
                    session['submitted']='yes'
                    db.commit()
                    render_template('poster.html',student_list=student_list,degree=degree,form=form,back=back,logout=logout)
                    session.pop('degree',None)
                    print(session)
                    if('Admin' not in session):
                        
                        flash("Successfully Added Student","success")
                        return redirect(url_for('index'))
                    else:
                        if('studentmodifydata' in session):
                            string="Successfully Modified Student Detail"
                            flash(string,"success")
                            return redirect(url_for('studentlist'))
                        else:
                            flash("Successfully Added Student","success")
                            return redirect(url_for('studentlist'))
                else:
                    db.rollback()
                    
                    flash("Error in Inserting the details.Please try Again","danger")
    return render_template('poster.html',student_list=student_list,degree=degree,form=form,back=back,logout=logout)



if __name__ == '__main__':
    app.run(debug=True,host='0.0.0.0')

