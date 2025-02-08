from django.shortcuts import render,HttpResponse

from fcb_app.models import *
from django.conf import settings
from django.core.files.storage import FileSystemStorage

from django.http import JsonResponse

from django.db.models import Q


from datetime import *



def home(request):
    return render(request,'home.html')


def adminhome(request):
    return render(request,'admin.html')

def admin_view_equipments(request,id):
    
    w=equipment.objects.filter(vendor_id=id)
    
    return render(request,'admin_view_equipments.html',{'q':w})



def admin_view_booking(request):
    
    w=booking.objects.all()
    
    return render(request,'admin_view_bookings.html',{'q':w})


def admin_view_user(request):
    
    w=user.objects.all()
    
    return render(request,'admin_view_user.html',{'q':w})


def admin_view_projects(request):
    
    w=project.objects.all()
    
    return render(request,'admin_view_projects.html',{'q':w})


def admin_view_complaint(request):
    
    w=complaint.objects.filter(reply='pending')
    
    return render(request,'admin_view_complaints.html',{'q':w})


def admin_view_review(request):
    
    w=review.objects.all()
    
    return render(request,'admin_view_review.html',{'q':w})

def reply(request,id):
    
    w=complaint.objects.get(complaint_id=id)
    if request.method=='POST':
        reply=request.POST['reply']
        w.reply=reply
        
        w.save()
        
        
        return HttpResponse("<script>alert('Replied');window.location='/admin_view_complaint';</script>")
    
    return render(request,'reply.html')

def manage_vendor(request):
    q=vendor.objects.all()
    return render(request,'admin_view_vendor.html',{'q':q})

def accept_vendor(request,id):
    
    v=login.objects.get(login_id=id)
    v.usertype='vendor'
    v.save()
    
    return HttpResponse("<script>alert('Accepted');window.location='/manage_vendors';</script>")

def reject_vendor(request,id):
    q=vendor.objects.get(login_id=id)
    q.delete()
    
    v=login.objects.get(login_id=id)
    v.delete()
    
    return HttpResponse("<script>alert('Deleted');window.location='/manage_vendors';</script>")


def vendorhome(request):
    return render(request,'vendor.html')

def vendor_reg(request):
    if request.method=='POST':
        name=request.POST['name']
        lnum=request.POST['lnum']
        phone=request.POST['phone']
        pin=request.POST['pin']
    
        city=request.POST['city']
        
        email=request.POST['email']
        uname=request.POST['uname']
        psw=request.POST['psw']
        
        tp=login.objects.filter(username=uname)
        
        if tp:
            return HttpResponse("<script>alert('Username Already Exist');window.location='/vendor_reg'</script>")
        else:
        
            a=login(username=uname,password=psw,usertype='pending')
            a.save()
            
            t=vendor(name=name,license_num=lnum,phone=phone,pin=pin,city=city,email=email,login=a)
            t.save()
            return HttpResponse("<script>alert('Registered Successfully');window.location='/';</script>")
        
        
        
    return render(request,'vendor_reg.html')




def manage_equipment(request):
    q=equipment.objects.filter(vendor_id=request.session['vid'])
    if request.method=='POST':
        name=request.POST['name']
        des=request.POST['des']
        ppd=request.POST['ppd']
       
        
        
            
        t=equipment(name=name,description=des,price_per_day=ppd,vendor_id=request.session['vid'])
        t.save()
        return HttpResponse("<script>alert('Added Successfully');window.location='/manage_equipment';</script>")
        
        
        
    return render(request,'manage_equipments.html',{'q':q})

def update_eq(request,id):
    a=equipment.objects.get(pk=id)
    
    
    if request.method=='POST':
        name=request.POST['name']
        des=request.POST['des']
        ppd=request.POST['ppd']
        
        a.name=name
        a.description=des
        a.price_per_day=ppd
        a.save()
        return HttpResponse("<script>alert('Updated');window.location='/manage_equipment';</script>")
    return render(request,'manage_equipments.html',{'a':a})

def delete_eq(request,id):
    
    w=equipment.objects.get(pk=id)
    
    w.delete()
    
    return HttpResponse("<script>alert('Deleted');window.location='/manage_equipment';</script>")


def vendor_view_booking(request):
    
    w=booking.objects.filter(equipment__vendor__pk=request.session['vid'])
    
    return render(request,'vendor_view_booking.html',{'q':w})


def vendor_view_project(request):
    
    w=project.objects.all()
    
    return render(request,'vendor_view_project.html',{'q':w})
    
    
def vendor_view_review(request):
    
    w=review.objects.filter(vendor_id=request.session['vid'])
    
    return render(request,'vendor_view_review.html',{'q':w})


def vendor_view_feedback(request):
    
    w=feedback.objects.filter(vendor_id=request.session['vid'])
    
    return render(request,'vendor_view_feedback.html',{'q':w})
    
    




def logins(request):
    if request.method=='POST':
        uname=request.POST['uname']
        psw=request.POST['psw']
        
        try:
            lg=login.objects.get(username=uname,password=psw)
            print(lg,"///////////////")
            
            request.session['login_id']=lg.pk
            lid=request.session['login_id']
            
            if lg.usertype=='admin':
                return HttpResponse("<script>alert('login successfull');window.location='adminhome';</script>")
            
            
            elif lg.usertype=='vendor':
                q=vendor.objects.get(login_id=lid)
                if q:
                    
                    request.session['vid']=q.pk
                    
                    return HttpResponse("<script>alert('login successfull');window.location='vendorhome';</script>")
            
            
        except:
            return HttpResponse("<script>alert('login Failed...!!!!');window.location='login';</script>")
    

    return render(request,'login.html')







def user_reg(request):
    print('///////////////////////////')
    data = {}
    name = request.GET.get('name')
    phone = request.GET.get('phone')
    
  
    pin= request.GET.get('pin')
    city=request.GET.get('city')

    
 
    
    
    email=request.GET.get('email')
    
    
    username=request.GET.get('uname')
    password=request.GET.get('psw')

    try:
        querylog = login(username=username, password=password,usertype='user')
        querylog.save()
        queryuse = user(name=name,pin=pin,phone=phone,email=email,city=city,login=querylog)
        queryuse.save()
    
        status = "success"
    except login.DoesNotExist:
        status = "error"
        message = "Invalid credentials"
    response = {
        'status': status,
        'data': data
    }

    if status == "error":
        response['message'] = message
    print(status)
    return JsonResponse(response)





def userlogin(request):
    data=[]
    username=request.GET.get('uname')
    password=request.GET.get('psw')
    
    try:
        queryset=login.objects.filter(username=username,password=password)
        
        print(queryset,"////////////////////////////")
        for q in queryset:
            use = user.objects.get(login_id=q.login_id)
           
            data.append({
                'login_id':q.login_id,
                'username':q.username,
                'password':q.password,
                'usertype':q.usertype,
                'user_id': use.user_id
                
            })
        if data:
            status = "success"
        else:
            status = "error"
            message="Invalid credential"
            
    except login.DoesNotExist:
        status = "error"
        message="Invalid credential"
        
    response = {
        
       'status': status,
        'data': data
    }
    print(data)
    print(status,"////status")
    
    if status == "error":
        response['message'] = message
        
    return JsonResponse(response)





def Feedback(request):
    print('///////////////////////////')
    data = {}
  
    
  
    
    
    feedbac=request.GET.get('feedback')
    lid=request.GET.get('log_id')
    f=user.objects.get(login_id=lid)
    pid=f.pk
    
    cdate=datetime.now().date()

    try:
        querylog = feedback(feedback=feedbac,date=cdate,client_id=pid)
        querylog.save()
     
    
        status = "success"
        method='feedback'
    except user.DoesNotExist:
        status = "error"
   
    response = {
        'status': status,
        'data': data,
        'method':method
    }

    if status == "error":
        response['status'] = status
    print(status)
    return JsonResponse(response)




def user_send_complaint(request):
    print("@@@@@@@@@@@@@@@")
    data={}
    login_id = request.GET.get('log_id')
    complain = request.GET.get('complaints')
    # date=timezone.now()
    
    from datetime import datetime

    current_datetime = datetime.now()

    # Separately obtaining date and time components
    current_date = current_datetime.date()
    current_time = current_datetime.time()
    try:
        use=user.objects.get(login_id=login_id)
        uid=use.user_id
        comp=complaint(user_id=uid,complaint=complain,date=current_datetime,reply='pending')
        comp.save()
        data['status'] ="success"
    except user.DoesNotExist:
        data['status'] ="failed"
    data['method'] = 'user_send_complaint'
    print(data['status'])
    return JsonResponse(data)


def user_view_complaint(request):
    print("!!!!!!!!#############!!!!!!!!!")
    data={}
    data['data']=[]
    login_id=request.GET.get('log_id')
    use=user.objects.get(login=login_id)
    uid=use.user_id
    user_cmp = complaint.objects.filter(user_id=uid).order_by('-date')
    try:
        for q in user_cmp:
            data['data'].append({
                'complaint':q.complaint,
                'date':q.date,
                'reply':q.reply,
                'user_id':q.user_id,
                
            })
        data['status'] = "success"
    except use.DoesNotExist:
        data['status'] = "failed"
    data['method'] = "user_view_complaint"
    print(data)
    return JsonResponse(data)



def c_profile(request):
    print("#############################")
    data={}
    data['data'] = []
    
    uid=request.GET.get("uid")
    
    
    
    
    productss=user.objects.filter(pk=uid)
    for q in productss:
        data['data'].append({
                    'name':q.name,
                    'phone':q.phone,
                    'email':q.email,
                 
                    'pin':q.pin,
          
                    'city':q.city,
             
                    
                    
                    
                    
                 })
    data['status'] = "success"
    print(data)
    return JsonResponse(data)




def add_project(request):
    print('///////////////////////////')
    data = {}
  
    
  
    pname= request.GET.get('pname')

    uid=request.GET.get('uid')
   
    
    des=request.GET.get('des')
    dur=request.GET.get('dur')
    
    sdate=request.GET.get('sdate')
    edate=request.GET.get('edate')
    
    bud=request.GET.get('bud')
    equip=request.GET.get('equip')
    
    cdate=datetime.now().date()
    
    
  

    try:
        querylog = project(user_id=uid,posted_date=cdate,project_name=pname,description=des,duration=dur,start_date=sdate,end_date=edate,budget=bud,equipment_requirement=equip,status='pending')
        querylog.save()
   
    
        status = "success"
      
    except project.DoesNotExist:
        status = "error"
        message = "Invalid credentials"
    response = {
        'status': status,
        'data': data,
      
    }

    if status == "error":
        response['message'] = message
    print(status)
    return JsonResponse(response)




def book_eq(request):
    print('///////////////////////////')
    data = {}
  
    
  
    rdate= request.GET.get('rdate')

    uid=request.GET.get('uid')
   
    
    bdate=request.GET.get('bdate')
    eid=request.GET.get('eid')
    
 
    
    cdate=datetime.now().date()
    
    
  

    try:
        querylog = booking(user_id=uid,book_date=bdate,return_date=rdate,date=cdate,status='pending',amount='pending',equipment_id=eid)
        querylog.save()
   
    
        status = "success"
      
    except booking.DoesNotExist:
        status = "error"
        message = "Invalid credentials"
    response = {
        'status': status,
        'data': data,
      
    }

    if status == "error":
        response['message'] = message
    print(status)
    return JsonResponse(response)




def pay_book(request):
 
    data = {}
  
    
  
    bid= request.GET.get('bid')

    uid=request.GET.get('uid')
   
    
    amt=request.GET.get('amt')
    
    
 
    
    cdate=datetime.now().date()
    
    
  

    try:
        
        e=booking.objects.get(pk=bid,user_id=uid)
        e.amount=amt
        e.status='paid'
        e.save()
        
        status='success'
        
    except booking.DoesNotExist:
        status = "error"
        message = "Invalid credentials"
    response = {
        'status': status,
        'data': data,
      
    }

    if status == "error":
        response['message'] = message
    print(status)
    return JsonResponse(response)







def Feedback(request):
    print('///////////////////////////')
    data = {}
  
    
  
    
    
    feedbac=request.GET.get('feedback')
    uid=request.GET.get('uid')
    vid=request.GET.get('vid')
    
 
    
    cdate=datetime.now().date()

    try:
        querylog = feedback(description=feedbac,date=cdate,user_id=uid,vendor_id=vid)
        querylog.save()
     
    
        status = "success"
        method='feedback'
    except feedback.DoesNotExist:
        status = "error"
   
    response = {
        'status': status,
        'data': data,
        'method':method
    }

    if status == "error":
        response['status'] = status
    print(status)
    return JsonResponse(response)




def revieww(request):
    print('///////////////////////////')
    data = {}
  
    
  
    
    
    feedbac=request.GET.get('review')
    uid=request.GET.get('uid')
    vid=request.GET.get('vid')
    rate=request.GET.get('rate')
    
    
 
    
    cdate=datetime.now().date()

    try:
        querylog = review(description=feedbac,rate=rate,date=cdate,user_id=uid,vendor_id=vid)
        querylog.save()
     
    
        status = "success"
        method='feedback'
    except feedback.DoesNotExist:
        status = "error"
   
    response = {
        'status': status,
        'data': data,
        'method':method
    }

    if status == "error":
        response['status'] = status
    print(status)
    return JsonResponse(response)






def user_view_bookings(request):
    print("#############################")
    data={}
    data['data'] = []
    
    uid=request.GET.get("uid")
    
    
    
    
    productss=booking.objects.filter(user_id=uid)
    for q in productss:
        data['data'].append({
                    'rdate':q.return_date,
                    'bdate':q.book_date,
                    'date':q.date,
                    'equipment':q.equipment.name,
                    'status':q.status,
                    'amount':q.amount,
                    
                    'bid':q.pk,
                    
                    })
    data['status'] = "success"
    print(data)
    return JsonResponse(data)


def view_project(request):
    print("#############################")
    data={}
    data['data'] = []
    
    uid=request.GET.get("uid")
    
    
    
    
    productss=project.objects.filter(user_id=uid)
    for q in productss:
        data['data'].append({
                    'pname':q.project_name,
                    'des':q.description,
                    'dur':q.duration,
                    'sdate':q.start_date,
                    'edate':q.end_date,
                    'bud':q.budget,
                    'equip':q.equipment_requirement,
                    'pid':q.pk,
                    
                    
                    
                   
                    
                    
                    
                    
                 })
    data['status'] = "success"
    print(data)
    return JsonResponse(data)





def view_vendor(request):
    print("#############################")
    data={}
    data['data'] = []
    productss=vendor.objects.all()
    for q in productss:
        data['data'].append({
                    'name':q.name,
                    'lnum':q.license_num,
                    'phone':q.phone,
                    'pin':q.pin,
                    'city':q.city,
                    'email':q.email,
                    'vid':q.pk,
                   
                     })
    data['status'] = "success"
    print(data)
    return JsonResponse(data)



def view_equip(request):
    print("#############################")
    data={}
    data['data'] = []
    
    vid=request.GET.get('vid')
    productss=equipment.objects.filter(vendor_id=vid)
    for q in productss:
        data['data'].append({
                    'name':q.name,
                    'des':q.description,
                    'ppd':q.price_per_day,
                    'date':q.date,
                 
                    'eid':q.pk,
                   
                     })
    data['status'] = "success"
    print(data)
    return JsonResponse(data)




def accept_book(request,id):
    
    if request.method=='POST':
        am=request.POST['amount']
        
        e=booking.objects.get(booking_id=id)
        
        e.amount=am
        e.status='pay'
        
        e.save()
        return HttpResponse("<script>alert('Amount Added');window.location='/vendor_view_bookings';</script>")
    return render(request,'accept_booking.html')
    
    
def reject_book(request,id):
    q=booking.objects.get(booking_id=id)
    q.status='rejected'
    q.save()
    return HttpResponse("<script>alert('Rejected');window.location='/vendor_view_bookings';</script>")