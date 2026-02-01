"""hirefellow URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from . import views
from django.conf.urls import url
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('',views.first),
    path('index',views.index),
    path('hrregistration',views.hrregistration),
    path('addhr',views.addhr),
    path('empregistration',views.empregistration),
    path('addemp',views.addemp),
    path('login/',views.login),
    path('login/addlogin',views.addlogin),
    path('logout/',views.logout),
    path('cndregistration',views.cndregistration),
    path('addcnd',views.addcnd),
    path('adddept',views.adddept),
    path('viewcandidate',views.viewcandidate),
    path('uapprove/<int:id>',views.uapprove,name="uapprove"),
    path('udelete/<int:id>',views.udelete),
    path('vdelete/<int:id>',views.vdelete),
    path('apply/<int:id>',views.apply),
    path('apply/addapply',views.addapply),
    path('deptregistration',views.deptregistration),
    path('vacancy',views.vacancy),
    path('adddvacancy',views.adddvacancy),
    path('viewvacancy',views.viewvacancy),
    path('viewvacancyy',views.viewvacancyy),
    path('qual',views.qual),
    path('addqual',views.addqual),
    path('viewcan',views.viewcan),
    path('cmplnt_emp',views.cmplnt_emp),
    path('cmplnt',views.cmplnt),
    path('addcmplnt',views.addcmplnt),
    path('addcmplnt_emp',views.addcmplnt_emp),
    path('viewjobapply',views.viewjobapply),
    path('viewjobapply_a',views.viewjobapply_a),
    path('viewvacancyy_cand',views.viewvacancyy_cand),
    path('viewqualification/<int:id>',views.viewqualification),
    path('japprove/<int:id>',views.japprove),
    path('japprove/addinterview',views.addinterview),
    path('viewcomplaint',views.viewcomplaint),
    path('reply/<int:id>',views.reply),
    path('reply_emp/<int:id>',views.reply_emp),
    path('passed/<int:id>',views.passed),
    path('fail/<int:id>',views.fail),
    path('passed/addplcmnt/<int:id>',views.addplcmnt),
    path('reply/addcmplntreply/<int:id>',views.addcmplntreply),
    path('reply_emp/addcmplntreply_emp/<int:id>',views.addcmplntreply_emp),
    path('viewreply',views.viewreply),
    path('viewreply_emp',views.viewreply_emp),
    path('viewinrvcall',views.viewinrvcall),
    path('feedbck',views.feedbck),
    path('addfeedback',views.addfeedback),
    path('viewfeedbck',views.viewfeedbck),
    path('viewqualification/back',views.back),
    path('viewinterview',views.viewinterview),
    path('viewplcmnt',views.viewplcmnt),
    path('promotionn',views.promotionn),
    path('addpromotion',views.addpromotion),
    path('viewpromo',views.viewpromo),
    path('papprove/<int:id>',views.papprove),
    path('preject/<int:id>',views.preject),
    path('viewpromores',views.viewpromores),
    path('dept_trnsfr',views.dept_trnsfr),
    path('branch_trnsfr',views.branch_trnsfr),
    path('adddepttrsfr',views.adddepttrsfr),
    path('addbranchtrsfr',views.addbranchtrsfr),
    path('viewdept_s',views.viewdept_s),
    path('viewbranch_s',views.viewbranch_s),
    path('viewtransferreq_dept',views.viewtransferreq_dept),
    path('tdapprove/<int:id>',views.tdapprove),
    path('tbapprove/<int:id>',views.tbapprove),
    path('tdreject/<int:id>',views.tdreject),
    path('tbreject/<int:id>',views.tbreject),
    path('leave',views.leave),
    path('addleave',views.addleave),
    path('viewleave',views.viewleave),
    path('viewbleavereq',views.viewbleavereq),
    path('lapprove/<int:id>',views.lapprove),
    path('lreject/<int:id>',views.lreject),
    path('markattendance/<int:id>',views.markattendance),
    path('assignjob/<int:id>',views.assignjob),
    path('attendance',views.attendance),
    path('viewattendance',views.viewattendance),
    path('assign_job',views.assign_job),
    path('markattendance/addattendance',views.addattendance),
    path('assignjob/addjobassign',views.addjobassign),
    path('viewassigned',views.viewassigned),
    path('jstart/<int:id>',views.jstart),
    path('jcmplt/<int:id>',views.jcmplt),
    path('basicpay',views.basicpay),
    path('addbasicpay',views.addbasicpay),
    path('viewemp',views.viewemp),
    path('salary/<int:id>',views.salary),
    path('salary/addsalary',views.addsalary),
    path('viewsal',views.viewsal),
    path('addskill',views.addskill),
    path('test',views.test),
    path('test1',views.test1),

















]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
