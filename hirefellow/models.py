from django.db import models


class hrreg(models.Model):
    name=models.CharField(max_length=150)
    lname=models.CharField(max_length=150)
    gender=models.CharField(max_length=150)
    dob=models.CharField(max_length=150)
    address=models.CharField(max_length=150)
    mob=models.CharField(max_length=150)
    qualification=models.CharField(max_length=150)
    email=models.CharField(max_length=150)
    nationality=models.CharField(max_length=150)
    password=models.CharField(max_length=150)
    username=models.CharField(max_length=150)
    status=models.CharField(max_length=150)

class employeereg(models.Model):
    name=models.CharField(max_length=150)
    lname=models.CharField(max_length=150)
    gender=models.CharField(max_length=150)
    dob=models.CharField(max_length=150)
    address=models.CharField(max_length=150)
    mob=models.CharField(max_length=150)
    qualification=models.CharField(max_length=150)
    designation=models.CharField(max_length=150)
    email=models.CharField(max_length=150)
    nationality=models.CharField(max_length=150)
    password=models.CharField(max_length=150)
    username=models.CharField(max_length=150)
    status=models.CharField(max_length=150)

class candidatereg(models.Model):
    name=models.CharField(max_length=150)
    mname=models.CharField(max_length=150)
    lname=models.CharField(max_length=150)
    gender=models.CharField(max_length=150)
    age=models.CharField(max_length=150)
    address=models.CharField(max_length=150)
    department=models.CharField(max_length=150)
    semester=models.CharField(max_length=150)
    district=models.CharField(max_length=150)
    password=models.CharField(max_length=150)
    username=models.CharField(max_length=150)
    status=models.CharField(max_length=150)
    image=models.FileField(max_length=150)

class department(models.Model):
    name=models.CharField(max_length=150)

class addjobvacancy(models.Model):
    title=models.CharField(max_length=150)
    venue=models.CharField(max_length=150)
    date=models.CharField(max_length=150)
    time=models.CharField(max_length=150)
    description=models.CharField(max_length=150)

class qualification(models.Model):
    cid=models.CharField(max_length=150)
    university=models.CharField(max_length=150)
    marks=models.CharField(max_length=150)
    qual=models.CharField(max_length=150)
    file=models.FileField(max_length=150)
    university1=models.CharField(max_length=150)
    marks1=models.CharField(max_length=150)
    qual1=models.CharField(max_length=150)
    file1=models.FileField(max_length=150)
    university2=models.CharField(max_length=150)
    marks2=models.CharField(max_length=150)
    qual2=models.CharField(max_length=150)
    file2=models.FileField(max_length=150)

class applyjob(models.Model):
    c_name=models.CharField(max_length=150)
    c_email=models.CharField(max_length=150)
    j_id=models.CharField(max_length=150)
    cuname=models.CharField(max_length=150)
    file=models.FileField(max_length=150)

class interview(models.Model):
    c_name=models.CharField(max_length=150)
    date=models.CharField(max_length=150)
    time=models.CharField(max_length=150)
    venue=models.CharField(max_length=150)

class complaints(models.Model):
    c_id=models.CharField(max_length=150)
    complaint=models.CharField(max_length=150)
    reply=models.CharField(max_length=150)

class complaints_emp(models.Model):
    e_id=models.CharField(max_length=150)
    complaint=models.CharField(max_length=150)
    reply=models.CharField(max_length=150)

class feedbacks(models.Model):
    c_id=models.CharField(max_length=150)
    feedback=models.CharField(max_length=150)
    message=models.CharField(max_length=150)

class placedcandidate(models.Model):
    c_id=models.CharField(max_length=150)
    i_id=models.CharField(max_length=150)
    department=models.CharField(max_length=150)
    year=models.CharField(max_length=150)
    company=models.CharField(max_length=150)
    image=models.FileField(max_length=150)

class promotions(models.Model):
    e_id=models.CharField(max_length=150)
    department=models.CharField(max_length=150)
    job=models.CharField(max_length=150)
    company=models.CharField(max_length=150)
    status=models.CharField(max_length=150)

class transfer_dept(models.Model):
    e_id=models.CharField(max_length=150)
    from_id=models.CharField(max_length=150)
    to_id=models.CharField(max_length=150)
    remark=models.CharField(max_length=150)
    status=models.CharField(max_length=150)

class transfer_branch(models.Model):
    e_id=models.CharField(max_length=150)
    from_b=models.CharField(max_length=150)
    to_b=models.CharField(max_length=150)
    remark=models.CharField(max_length=150)
    status=models.CharField(max_length=150)


class tbl_leave(models.Model):
    e_id=models.CharField(max_length=150)
    date=models.CharField(max_length=150)
    purpose=models.CharField(max_length=150)
    status=models.CharField(max_length=150)

class emp_attendance(models.Model):
    empid=models.CharField(max_length=150)
    date=models.DateField(max_length=150)
    status=models.CharField(max_length=150)

class jobassign(models.Model):
    empid=models.CharField(max_length=150)
    title=models.CharField(max_length=150)
    description=models.CharField(max_length=150)
    status=models.CharField(max_length=150)

class basic(models.Model):
    designation=models.CharField(max_length=150)
    basicpay=models.CharField(max_length=150)


class salary_tb(models.Model):
    e_id=models.CharField(max_length=150)
    month=models.DateField(max_length=150)
    salary=models.CharField(max_length=150)

class upload(models.Model):
    image=models.CharField(max_length=150)
    skills=models.CharField(max_length=150)