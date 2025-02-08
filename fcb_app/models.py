from django.db import models

# Create your models here.


class login(models.Model):
    login_id=models.AutoField(primary_key=True)
    username=models.CharField(max_length=225)
    password=models.CharField(max_length=225)
    usertype=models.CharField(max_length=225)
    


class vendor(models.Model):
    vendor_id=models.AutoField(primary_key=True)
    login=models.ForeignKey(login,on_delete=models.CASCADE)
    name=models.CharField(max_length=225)
    license_num=models.CharField(max_length=225)
    phone=models.CharField(max_length=225)
    pin=models.CharField(max_length=225)
    city=models.CharField(max_length=225)
    email=models.CharField(max_length=225)
     
    
class user(models.Model):
    user_id=models.AutoField(primary_key=True)
    login=models.ForeignKey(login,on_delete=models.CASCADE)
    name=models.CharField(max_length=225)
   
    phone=models.CharField(max_length=225)
    pin=models.CharField(max_length=225)
    city=models.CharField(max_length=225)
    email=models.CharField(max_length=225)
    
    
class equipment(models.Model):
    equipment_id=models.AutoField(primary_key=True)
    vendor=models.ForeignKey(vendor,on_delete=models.CASCADE)
    name=models.CharField(max_length=225)
   
    description=models.CharField(max_length=225)
    price_per_day=models.CharField(max_length=225)
    date=models.CharField(max_length=225)
    


class booking(models.Model):
    booking_id=models.AutoField(primary_key=True)
    user=models.ForeignKey(user,on_delete=models.CASCADE)
    equipment=models.ForeignKey(equipment,on_delete=models.CASCADE)
   
    book_date=models.CharField(max_length=225)
    return_date=models.CharField(max_length=225)
    date=models.CharField(max_length=225)
    amount=models.CharField(max_length=225)
    
    status=models.CharField(max_length=225)
  
  
  
class complaint(models.Model):
    complaint_id=models.AutoField(primary_key=True)
    user=models.ForeignKey(user,on_delete=models.CASCADE)
    complaint=models.CharField(max_length=225)
    reply=models.CharField(max_length=225)
    
    date=models.CharField(max_length=225) 
     
    

class review(models.Model):
    review_id=models.AutoField(primary_key=True)
    user=models.ForeignKey(user,on_delete=models.CASCADE)
    vendor=models.ForeignKey(vendor,on_delete=models.CASCADE)
    description=models.CharField(max_length=225)
    rate=models.CharField(max_length=225)
    date=models.CharField(max_length=225) 
    
    
class feedback(models.Model):
    feedback_id=models.AutoField(primary_key=True)
    user=models.ForeignKey(user,on_delete=models.CASCADE)
    vendor=models.ForeignKey(vendor,on_delete=models.CASCADE)
    description=models.CharField(max_length=225)
   
    date=models.CharField(max_length=225) 
   
   
class payment(models.Model):
    payment_id=models.AutoField(primary_key=True)
    booking=models.ForeignKey(booking,on_delete=models.CASCADE)
    amount=models.CharField(max_length=225)
    date=models.CharField(max_length=225) 
    status=models.CharField(max_length=225) 
    
    
    
class project(models.Model):
    project_id=models.AutoField(primary_key=True)
    user=models.ForeignKey(user,on_delete=models.CASCADE)
    project_name=models.CharField(max_length=225)
    description=models.CharField(max_length=225)
    duration=models.CharField(max_length=225)
    start_date=models.CharField(max_length=225)
    end_date=models.CharField(max_length=225)
    budget=models.CharField(max_length=225)
    equipment_requirement=models.CharField(max_length=225)
    posted_date=models.CharField(max_length=225)
    status=models.CharField(max_length=225)
    
    status=models.CharField(max_length=225) 
    
    
    
    
    
    
    


