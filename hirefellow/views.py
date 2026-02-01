from django.http import HttpResponse,HttpResponseRedirect
from django.shortcuts import render
from django.shortcuts import redirect
from django.urls import reverse
from  django.core.files.storage import FileSystemStorage
import datetime
import os

from ML import resume


from .models import *

def first(request):
    return render(request,'index.html')

def index(request):
    return render(request,'index.html')

def hrregistration(request):
    return render(request,'hrregister.html')

def addhr(request):
    if request.method=="POST":
        name=request.POST.get('fname')
        lname=request.POST.get('lname')
        gender=request.POST.get('gender')
        dob=request.POST.get('dob')
        address=request.POST.get('address')
        mob=request.POST.get('mob')
        qualification=request.POST.get('qualification')
        email=request.POST.get('email')
        nationality=request.POST.get('nationality')
        password=request.POST.get('password')
        username=request.POST.get('uname')
        status=request.POST.get('status')

        cus=hrreg(name=name,lname=lname,gender=gender,dob=dob,address=address,mob=mob,qualification=qualification,nationality=nationality,username=username,email=email,password=password,status=status)
        cus.save()
        return render(request,'index.html')
    
def empregistration(request):
    return render(request,'empregister.html')

def addemp(request):
    if request.method=="POST":
        name=request.POST.get('fname')
        lname=request.POST.get('lname')
        gender=request.POST.get('gender')
        dob=request.POST.get('dob')
        address=request.POST.get('address')
        mob=request.POST.get('mob')
        qualification=request.POST.get('qualification')
        designation=request.POST.get('des')
        email=request.POST.get('email')
        nationality=request.POST.get('nationality')
        password=request.POST.get('password')
        username=request.POST.get('uname')
        status=request.POST.get('status')

        cus=employeereg(name=name,lname=lname,gender=gender,dob=dob,address=address,mob=mob,qualification=qualification,designation=designation,nationality=nationality,username=username,email=email,password=password,status=status)
        cus.save()
        return render(request,'index.html')
    
def cndregistration(request):
    return render(request,'cndregister.html')

def addcnd(request):
    if request.method=="POST":
        name=request.POST.get('fname')
        mname=request.POST.get('mname')
        lname=request.POST.get('lname')
        age=request.POST.get('age')
        gender=request.POST.get('gender')
        dept=request.POST.get('dept')
        #sem=request.POST.get('sem')
        address=request.POST.get('address')
        district=request.POST.get('district')
        password=request.POST.get('password')
        username=request.POST.get('uname')
        status=request.POST.get('status')
        image = request.FILES['image']
        fs = FileSystemStorage()
        image = fs.save(image.name,image)

        cus=candidatereg(name=name,mname=mname,lname=lname,age=age,gender=gender,department=dept,address=address,district=district,username=username,password=password,status=status,image=image)
        cus.save()
        return render(request,'index.html')

    
def login(request):
    return render(request,'login.html')

def addlogin(request):
    username = request.POST.get('uname')
    password = request.POST.get('password')
    if username == 'admin' and password =='admin':
        request.session['logintdetail'] = username
        request.session['admin'] = 'admin'
        return redirect(index)

    elif hrreg.objects.filter(username=username,password=password).exists():
        userdetails=hrreg.objects.get(username=request.POST['uname'], password=password)
        if userdetails.password == request.POST['password']:
            request.session['hid'] = userdetails.id
           # request.session['uname'] = userdetails.name

            return redirect(index)

    # elif employeereg.objects.filter(username=username,password=password).exists():
    #     userdetails=employeereg.objects.get(username=request.POST['uname'], password=password)
    #     if userdetails.password == request.POST['password']:
    #         request.session['eid'] = userdetails.id
    #         request.session['email'] = userdetails.email

    #         return redirect(index)
        
    elif candidatereg.objects.filter(username=username,password=password,status='approved').exists():
        userdetails=candidatereg.objects.get(username=request.POST['uname'], password=password)
        if userdetails.password == request.POST['password']:
            request.session['cid'] = userdetails.id
          

            return redirect(index)

    else:
        return render(request, 'login.html',{'success':'Invalid email id or Password'})
    
def logout(request):
    session_keys = list(request.session.keys())
    for key in session_keys:
        del request.session[key]
    return redirect(first)

def viewcandidate(request):
    user = candidatereg.objects.all()
    return render(request, 'viewcan.html', {'result': user})

def uapprove(request,id):
    sel=candidatereg.objects.get(id=id)
    a=sel.name
    b=sel.mname
    c=sel.lname
    d=sel.gender
    e=sel.age
    f=sel.address
    g=sel.department
    h=sel.semester
    i=sel.district
    j=sel.password
    k=sel.username
    l=sel.image
    upd=candidatereg(name=a,mname=b,gender=d,age=e,lname=c,address=f,department=g,semester=h,district=i,password=j,username=k,image=l,status='approved',id=id)
    upd.save()
    return redirect(viewcandidate)


def udelete(request,id):
    sel=candidatereg.objects.get(id=id)
    sel.delete()
    return redirect(viewcandidate)

def deptregistration(request):
    return render(request,'deptregister.html')

def adddept(request):
    if request.method=="POST":
        name=request.POST.get('name')
       

        cus=department(name=name)
        cus.save()
        return render(request,'index.html')
    

def vacancy(request):
    return render(request,'addvacancy.html')


def adddvacancy(request):
    if request.method=="POST":
        title=request.POST.get('title')
        venue=request.POST.get('venue')
        date=request.POST.get('date')
        time=request.POST.get('time')
        description=request.POST.get('description')
       
        cus=addjobvacancy(title=title,venue=venue,date=date,time=time,description=description)
        cus.save()
        return render(request,'index.html')
    
def viewvacancy(request):
    user = addjobvacancy.objects.all()
    return render(request, 'viewvacancy.html', {'result': user})

def qual(request):
    return render(request,'addqualification.html')

def addqual(request):
    if request.method=="POST":
        cid = request.session['cid']
        university=request.POST.get('university')
        marks=request.POST.get('marks')
        qual=request.POST.get('qual')
        file = request.FILES['file']
        fs = FileSystemStorage()
        file = fs.save(file.name,file)
        university1=request.POST.get('university1')
        marks1=request.POST.get('marks1')
        qual1=request.POST.get('qual1')
        file1 = request.FILES['file1']
        fs = FileSystemStorage()
        file1 = fs.save(file1.name,file1)
        university2=request.POST.get('university2')
        marks2=request.POST.get('marks2')
        qual2=request.POST.get('qual2')
        file2 = request.FILES['file2']
        fs = FileSystemStorage()
        file2 = fs.save(file2.name,file2)

        cus=qualification(cid=cid,university=university,marks=marks,qual=qual,file=file,university1=university1,marks1=marks1,qual1=qual1,file1=file1,university2=university2,marks2=marks2,qual2=qual2,file2=file2)
        cus.save()
        return render(request,'index.html')

def viewvacancyy(request):
    user = addjobvacancy.objects.all()
    return render(request, 'viewvacancyy.html', {'result': user})

def vdelete(request,id):
    sel=addjobvacancy.objects.get(id=id)
    sel.delete()
    return redirect(viewvacancyy)

def viewcan(request):
    user = candidatereg.objects.filter(status='approved')
    return render(request, 'viewcandidate.html', {'result': user})

def viewqualification(request,id):
    data=qualification.objects.get(id=id)
    
    return render(request,'v_qualification.html',{'result':data})

def back(request):
    return redirect(viewcan)

def viewvacancyy_cand(request):
    user = addjobvacancy.objects.all()
    return render(request, 'viewvacancyy_cand.html', {'result': user})

def apply(request,id):
    data=addjobvacancy.objects.get(id=id)
    return render(request,'applyjob.html',{'result':data})

def addapply(request):
    if request.method=="POST":
        c_name=request.session['cid']
        c_email=request.POST.get('cemail')
        j_id=request.POST.get('j_id')
        cuname=request.POST.get('cuname')
        file = request.FILES['file']
        fs = FileSystemStorage()
        file = fs.save(file.name,file)


        cus=applyjob(c_name=c_name,c_email=c_email,j_id=j_id,cuname=cuname,file=file)
        cus.save()
        return redirect(viewvacancyy_cand)
    
def viewjobapply(request):
    user = applyjob.objects.all()
    user3= candidatereg.objects.all()
    for i in user:
        for j in user3:
            if str(i.c_name)==str(j.id):
                i.c_name=j.name
    user4= addjobvacancy.objects.all()
    for i in user:
        for j in user4:
            if str(i.j_id)==str(j.id):
                i.j_id=j.title
    return render(request, 'viewjobapplyy.html', {'result': user})

def japprove(request,id):
    data=applyjob.objects.get(id=id)
    return render(request,'interview.html',{'result':data})

def addinterview(request):
    if request.method=="POST":
        c_name=request.POST.get('c_id')
        date=request.POST.get('date')
        time=request.POST.get('time')
        venue=request.POST.get('venue')
      
        cus=interview(c_name=c_name,date=date,time=time,venue=venue)
        cus.save()
        return redirect(viewjobapply)
    
def viewjobapply_a(request):
    user = applyjob.objects.all()
    user3= candidatereg.objects.all()
    for i in user:
        for j in user3:
            if str(i.c_name)==str(j.id):
                i.c_name=j.name
    user4= addjobvacancy.objects.all()
    for i in user:
        for j in user4:
            if str(i.j_id)==str(j.id):
                i.j_id=j.title
    return render(request, 'viewjobapplyy_a.html', {'result': user})

def cmplnt(request):
    return render(request,'addcomplaint.html')

def addcmplnt(request):
    if request.method=="POST":
        c_id=request.session['cid']
        complaint=request.POST.get('complaint')
      
        cus=complaints(c_id=c_id,complaint=complaint)
        cus.save()
        return render(request,'index.html')
    
def viewcomplaint(request):
    user = complaints.objects.all()
    user1= candidatereg.objects.all()
    for i in user:
        for j in user1:
            if str(i.c_id)==str(j.id):
                i.c_id=j.name
    user2 = complaints_emp.objects.all()
    user3= employeereg.objects.all()
    for i in user2:
        for j in user3:
            if str(i.e_id)==str(j.id):
                i.e_id=j.name
    return render(request, 'viewcomplaint.html', {'result': user,'result1': user2})

def reply(request,id):
    sel=complaints.objects.get(id=id)
    return render(request,'cmpltreply.html',{'result':sel})

def addcmplntreply(request,id):
    if request.method=="POST":
       
        reply=request.POST.get('reply')
        c_id=request.POST.get('c_id')
        complaint=request.POST.get('complaint')
      
        cus=complaints(c_id=c_id,complaint=complaint,reply=reply,id=id)
        cus.save()
        return redirect(viewcomplaint)
    

def viewreply(request):
    cid=request.session['cid']
    sel=complaints.objects.filter(c_id=cid)
    user= candidatereg.objects.all()
    for i in sel:
        for j in user:
            if str(i.c_id)==str(j.id):
                i.c_id=j.name
    return render(request,'viewreply.html',{'result':sel})

def viewinrvcall(request):
    cid=request.session['cid']
    sel=interview.objects.filter(c_name=cid)
    user= candidatereg.objects.all()
    for i in sel:
        for j in user:
            if str(i.c_name)==str(j.id):
                i.c_name=j.name
    return render(request,'viewinterview.html',{'result':sel})

def cmplnt_emp(request):
    return render(request,'addcomplaint_emp.html')

def addcmplnt_emp(request):
    if request.method=="POST":
        e_id=request.session['eid']
        complaint=request.POST.get('complaint')
      
        cus=complaints_emp(e_id=e_id,complaint=complaint)
        cus.save()
        return render(request,'index.html')
    
def reply_emp(request,id):
    sel=complaints_emp.objects.get(id=id)
    return render(request,'cmpltreply_emp.html',{'result':sel})

def addcmplntreply_emp(request,id):
    if request.method=="POST":
       
        reply=request.POST.get('reply')
        e_id=request.POST.get('e_id')
        complaint=request.POST.get('complaint')
      
        cus=complaints_emp(e_id=e_id,complaint=complaint,reply=reply,id=id)
        cus.save()
        return redirect(viewcomplaint)
    
def viewreply_emp(request):
    eid=request.session['eid']
    sel=complaints_emp.objects.filter(e_id=eid)
    user= employeereg.objects.all()
    for i in sel:
        for j in user:
            if str(i.e_id)==str(j.id):
                i.e_id=j.name
    return render(request,'viewreply_emp.html',{'result':sel})


def feedbck(request):
    return render(request,'feedback.html')

def addfeedback(request):
    if request.method=="POST":
        c_id=request.session['cid']
        feedback=request.POST.get('feedback')
        message=request.POST.get('message')
      
        cus=feedbacks(c_id=c_id,feedback=feedback,message=message)
        cus.save()
        return render(request,'index.html')
    
def viewfeedbck(request):
    user = feedbacks.objects.all()
    user1= candidatereg.objects.all()
    for i in user:
        for j in user1:
            if str(i.c_id)==str(j.id):
                i.c_id=j.name
   
    return render(request, 'viewfeedbacks.html', {'result': user})

    
def viewinterview(request):
    user = interview.objects.all()
    user1= candidatereg.objects.all()
    for i in user:
        for j in user1:
            if str(i.c_name)==str(j.id):
                i.c_name=j.name
   
    return render(request, 'viewintrv.html', {'result': user})

def passed(request,id):
    sel=interview.objects.get(id=id)
    return render(request,'placement.html',{'result':sel})

def addplcmnt(request,id):
    if request.method=="POST":
        c_id=request.POST.get('c_id')
        i_id=request.POST.get('i_id')
        department=request.POST.get('department')
        year=request.POST.get('year')
        company=request.POST.get('company')
       
        image = request.FILES['image']
        fs = FileSystemStorage()
        image = fs.save(image.name,image)

        cus=placedcandidate(c_id=c_id,i_id=i_id,department=department,year=year,company=company,image=image,id=id)
        cus.save()
        return redirect(viewinterview)
    
def fail(request,id):
    sel=interview.objects.get(id=id)
    sel.delete()
    return redirect(viewinterview)

def viewplcmnt(request):
    user = placedcandidate.objects.all()
    user1= candidatereg.objects.all()
    for i in user:
        for j in user1:
            if str(i.c_id)==str(j.id):
                i.c_id=j.name
   
    return render(request, 'viewplacement.html', {'result': user})

def promotionn(request):
    return render(request,'promotion.html')

def addpromotion(request):
    if request.method=="POST":
        e_id=request.session['eid']
        department=request.POST.get('department')
        job=request.POST.get('job')
        company=request.POST.get('company')
        status=request.POST.get('status')
  
        cus=promotions(e_id=e_id,department=department,job=job,company=company,status=status)
        cus.save()
        return render(request,'index.html')
    
def viewpromo(request):
    user = promotions.objects.all()
    user1= employeereg.objects.all()
    for i in user:
        for j in user1:
            if str(i.e_id)==str(j.id):
                i.e_id=j.name
   
    return render(request, 'viewpromoreq.html', {'result': user})

def papprove(request,id):
    sel=promotions.objects.get(id=id)
    a=sel.e_id
    b=sel.department
    c=sel.job
    d=sel.company
   
    upd=promotions(e_id=a,department=b,job=c,company=d,status='approved',id=id)
    upd.save()
    return redirect(viewpromo)

def preject(request,id):
    sel=promotions.objects.get(id=id)
    a=sel.e_id
    b=sel.department
    c=sel.job
    d=sel.company
   
    upd=promotions(e_id=a,department=b,job=c,company=d,status='rejected',id=id)
    upd.save()
    return redirect(viewpromo)

def viewpromores(request):
    eid=request.session['eid']
    sel=promotions.objects.filter(e_id=eid)
    user= employeereg.objects.all()
    for i in sel:
        for j in user:
            if str(i.e_id)==str(j.id):
                i.e_id=j.name
    return render(request,'v_promores.html',{'result':sel})

def dept_trnsfr(request):
    return render(request,'dept_transfer.html')

def adddepttrsfr(request):
    if request.method=="POST":
        e_id=request.session['eid']
        from_id=request.POST.get('from_id')
        to_id=request.POST.get('to_id')
        remark=request.POST.get('remark')
        status=request.POST.get('status')
  
        cus=transfer_dept(e_id=e_id,from_id=from_id,to_id=to_id,remark=remark,status=status)
        cus.save()
        return render(request,'index.html')
    
def viewtransferreq_dept(request):
    user = transfer_dept.objects.all()
    user1= employeereg.objects.all()
    for i in user:
        for j in user1:
            if str(i.e_id)==str(j.id):
                i.e_id=j.name

    user2 = transfer_branch.objects.all()
    user3= employeereg.objects.all()
    for i in user2:
        for j in user3:
            if str(i.e_id)==str(j.id):
                i.e_id=j.name
   
    return render(request, 'viewtrsfrreq_dept.html', {'result': user,'result1': user2})

def tdapprove(request,id):
    sel=transfer_dept.objects.get(id=id)
    a=sel.e_id
    b=sel.from_id
    c=sel.to_id
    d=sel.remark
   
    upd=transfer_dept(e_id=a,from_id=b,to_id=c,remark=d,status='approved',id=id)
    upd.save()
    return redirect(viewtransferreq_dept)

def tdreject(request,id):
    sel=transfer_dept.objects.get(id=id)
    a=sel.e_id
    b=sel.from_id
    c=sel.to_id
    d=sel.remark
   
    upd=transfer_dept(e_id=a,from_id=b,to_id=c,remark=d,status='rejected',id=id)
    upd.save()
    return redirect(viewtransferreq_dept)

def viewdept_s(request):
    eid=request.session['eid']
    sel=transfer_dept.objects.filter(e_id=eid)
    user= employeereg.objects.all()
    for i in sel:
        for j in user:
            if str(i.e_id)==str(j.id):
                i.e_id=j.name
    return render(request,'v_deptres.html',{'result':sel})

def branch_trnsfr(request):
    return render(request,'branch_transfer.html')

def addbranchtrsfr(request):
    if request.method=="POST":
        e_id=request.session['eid']
        from_b=request.POST.get('from_b')
        to_b=request.POST.get('to_b')
        remark=request.POST.get('remark')
        status=request.POST.get('status')
  
        cus=transfer_branch(e_id=e_id,from_b=from_b,to_b=to_b,remark=remark,status=status)
        cus.save()
        return render(request,'index.html')
    
def tbapprove(request,id):
    sel=transfer_branch.objects.get(id=id)
    a=sel.e_id
    b=sel.from_b
    c=sel.to_b
    d=sel.remark
   
    upd=transfer_branch(e_id=a,from_b=b,to_b=c,remark=d,status='approved',id=id)
    upd.save()
    return redirect(viewtransferreq_dept)

def tbreject(request,id):
    sel=transfer_branch.objects.get(id=id)
    a=sel.e_id
    b=sel.from_b
    c=sel.to_b
    d=sel.remark
   
    upd=transfer_branch(e_id=a,from_b=b,to_b=c,remark=d,status='rejected',id=id)
    upd.save()
    return redirect(viewtransferreq_dept)

def viewbranch_s(request):
    eid=request.session['eid']
    sel=transfer_branch.objects.filter(e_id=eid)
    user= employeereg.objects.all()
    for i in sel:
        for j in user:
            if str(i.e_id)==str(j.id):
                i.e_id=j.name
    return render(request,'v_branchres.html',{'result':sel})

def leave(request):
    return render(request,'leave.html')

def addleave(request):
    if request.method=="POST":
        e_id=request.session['eid']
        date=request.POST.get('date')
        purpose=request.POST.get('purpose')
        status=request.POST.get('status')
  
        cus=tbl_leave(e_id=e_id,date=date,purpose=purpose,status=status)
        cus.save()
        return render(request,'index.html')
    
def viewleave(request):
   
    sel=tbl_leave.objects.all()
    user= employeereg.objects.all()
    for i in sel:
        for j in user:
            if str(i.e_id)==str(j.id):
                i.e_id=j.email
    return render(request,'v_leave.html',{'result':sel})

def lapprove(request,id):
    sel=tbl_leave.objects.get(id=id)
    a=sel.e_id
    b=sel.date
    c=sel.purpose
   
    upd=tbl_leave(e_id=a,date=b,purpose=c,status='approved',id=id)
    upd.save()
    return redirect(viewleave)

def lreject(request,id):
    sel=tbl_leave.objects.get(id=id)
    a=sel.e_id
    b=sel.date
    c=sel.purpose
   
    upd=tbl_leave(e_id=a,date=b,purpose=c,status='rejected',id=id)
    upd.save()
    return redirect(viewleave)

def viewbleavereq(request):
    eid=request.session['eid']
    sel=tbl_leave.objects.filter(e_id=eid)
    user= employeereg.objects.all()
    for i in sel:
        for j in user:
            if str(i.e_id)==str(j.id):
                i.e_id=j.email
    return render(request,'v_leaveres.html',{'result':sel})

def attendance(request):
    user = employeereg.objects.all()
    return render(request, 'attendance.html', {'result': user})

def addattendance(request):
    if request.method=="POST":
        empid=request.POST.get('empid')
        date=request.POST.get('date')
        status=request.POST.get('status')

        cus=emp_attendance(empid=empid,date=date,status=status)
        cus.save()
        return redirect(attendance)
    

def markattendance(request,id):
    data=employeereg.objects.get(id=id)
    return render(request,'mark_attendance.html',{'result':data})

def viewattendance(request):
    user = emp_attendance.objects.all()
    user1= employeereg.objects.all()
    for i in user:
        for j in user1:
            if str(i.empid)==str(j.id):
                i.empid=j.name
    return render(request, 'viewattendance.html', {'result': user})

def assign_job(request):
    sel=employeereg.objects.all()
    return render(request,'assign.html',{'result':sel})

def assignjob(request,id):
    data=employeereg.objects.get(id=id)
    return render(request,'jobassign.html',{'result':data})

def addjobassign(request):
    if request.method=="POST":
        empid=request.POST.get('empid')
        title=request.POST.get('title')
        description=request.POST.get('description')
        status=request.POST.get('status')

        cus=jobassign(empid=empid,title=title,description=description,status=status)
        cus.save()
        return redirect(assign_job)
    
def viewassigned(request):
    eid=request.session['eid']
    sel=jobassign.objects.filter(empid=eid)
    user= employeereg.objects.all()
    for i in sel:
        for j in user:
            if str(i.empid)==str(j.id):
                i.empid=j.name
    return render(request,'viewassigned_job.html',{'result':sel})

def jstart(request,id):
    sel=jobassign.objects.get(id=id)
    a=sel.empid
    b=sel.title
    c=sel.description
   
    upd=jobassign(empid=a,title=b,description=c,status='Processing',id=id)
    upd.save()
    return redirect(viewassigned)

def jcmplt(request,id):
    sel=jobassign.objects.get(id=id)
    a=sel.empid
    b=sel.title
    c=sel.description
   
    upd=jobassign(empid=a,title=b,description=c,status='Completed',id=id)
    upd.save()
    return redirect(viewassigned)

def basicpay(request):
    user = employeereg.objects.all()
    return render(request, 'basic_pay.html', {'result': user})

def addbasicpay(request):
    if request.method=="POST":
        designation=request.POST.get('designation')
        basicpay=request.POST.get('basicpay')
       
  
        cus=basic(basicpay=basicpay,designation=designation)
        cus.save()
    return render(request,'index.html')

def viewemp(request):
    user = employeereg.objects.all()
    return render(request, 'viewemp.html', {'result': user})

def salary(request,id):
    data=employeereg.objects.get(id=id)
    return render(request,'salaryy.html',{'result':data})

def addsalary(request):
    if request.method=="POST":

        e_id=request.POST.get('e_id')
        month=request.POST.get('month')
        #salary=request.POST.get('salary')
        #print(month[:4],month[5:7])
        desig=employeereg.objects.get(id=e_id).designation
        basic_sal=basic.objects.get(designation=desig).basicpay
        #print(desig,basic_sal)
        attend=emp_attendance.objects.filter(date__year=str(month[:4]),date__month=str(month[5:7]),empid=e_id,status="present")
        #print("attendence:",len(attend))
        total_sal=int(basic_sal)*len(attend)
        #print(total_sal)
        sal_det=salary_tb.objects.filter(e_id=e_id,month__year=str(month[:4]),month__month=str(month[5:7]))
        if len(sal_det)==0:
            cus=salary_tb(e_id=e_id,month=month,salary=total_sal)
            cus.save()
        else:
            return render(request,'index.html',{'res':' This Month Salary is Already Updated for this Staff'})
        #print("sal_det:",len(sal_det))
        #cus=salary_tb(e_id=e_id,month=month,salary=total_sal)
        #cus.save()
    return render(request,'index.html',{'res1':' Salary Updated'})

def viewsal(request):
    user = salary_tb.objects.all()
    user1= employeereg.objects.all()
    for i in user:
        for j in user1:
            if str(i.e_id)==str(j.id):
                i.e_id=j.name
    return render(request, 'viewemp_salary.html', {'result': user})

def addskill(request):
    if request.method=="POST":
        image=request.FILES['image']
        try:
            os.remove("media/input/CV1.pdf")
        except:
            pass 
        fs= FileSystemStorage(location="media/input")
        filename=fs.save("CV1.pdf",image) 
        result=resume.predict()
        print (result)
        upd=upload(image=filename,skills=result)
        upd.save()
        return render(request,'result.html',{'res':result})
    return render(request,'upload.html')


def test(request):
    user = candidatereg.objects.all()
    return render(request, 'test.html', {'result': user})

def test1(request):

    return render(request,'test1.html')