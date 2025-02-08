from django.contrib import admin
from django.urls import path,include   
from .import views

urlpatterns = [
    
    
    # ----------------------------public functions-----------------------------------
    
    
    path('',views.home),
    path('login',views.logins),
    
    
    path('adminhome',views.adminhome),
    
    path('admin_view_equipments/<id>',views.admin_view_equipments),
    
    path('admin_view_projects',views.admin_view_projects),
    
    path('admin_view_bookings',views.admin_view_booking),
    
    path('admin_view_users',views.admin_view_user),
    
    path('admin_view_complaint',views.admin_view_complaint),
    
    path('reply/<id>',views.reply),
    
    path('admin_view_review',views.admin_view_review),
    
    
    
    
    
    
    
    path('vendor_reg',views.vendor_reg,name='vendor_reg'),
    path('manage_vendors',views.manage_vendor),
    
    path('accept_vendor/<id>',views.accept_vendor),
    
    path('reject_vendor/<id>',views.reject_vendor),
    
    
    path('vendorhome',views.vendorhome),
    
    path('manage_equipment',views.manage_equipment),
    
    path('update_eq/<id>',views.update_eq),
    
    path('delete_eq/<id>',views.delete_eq),
    
    
    path('vendor_view_bookings',views.vendor_view_booking),
    
    path('vendor_view_project',views.vendor_view_project),
    
    path('vendor_view_review',views.vendor_view_review),
    
    
    path('vendor_view_feedback',views.vendor_view_feedback),
    
    
    path('accept_book/<id>',views.accept_book),
    
    path('reject_book/<id>',views.reject_book),
    
    
    
    
    
    
    
    path('user_reg',views.user_reg,name='user_reg'),
    path('user_login',views.userlogin,name='userlogin'),
    
    path('c_profile',views.c_profile,name='c_profile'),
    
    
    
    
    path('user_send_complaint',views.user_send_complaint,name='user_send_complaint'),
    
    path('user_view_complaint',views.user_view_complaint,name='user_view_complaint'),
    
    path('add_project',views.add_project,name='add_project'),
    
    
    
    path('feedback',views.Feedback),
    
    path('review',views.revieww),
    
    path('view_project',views.view_project),
    
    path('view_vendor',views.view_vendor),
    
    path('view_equip',views.view_equip),
    
    path('book_eq',views.book_eq),
    
    path('user_view_bookings',views.user_view_bookings),
    
    path('pay_book',views.pay_book),
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
   
    
    


    
]
