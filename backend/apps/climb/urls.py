from django.urls import path
from . import views
from rest_framework.urlpatterns import format_suffix_patterns


urlpatterns = [
    path('crags/', views.CragsList.as_view(), name='crag-list'),
    path('crags/map/', views.CragMap.as_view(), name='crag-list'),

    path('crags/<uuid:pk>/', views.CragDetail.as_view(), name='crag-detail'),
    path('crags/add/', views.CragsAdd.as_view(), name='crag-add'),
    path('sectors/', views.SectorList.as_view(), name='sector-list'),
    path('sectors/<uuid:pk>/', views.SectorDetail.as_view(), name='sector-detail'),
    path('sectors/add/', views.SectorAdd.as_view(), name='sector-add'),
    path('routes/', views.RouteList.as_view(), name='route-list'),
    path('routes/<uuid:pk>/', views.RouteDetail.as_view(), name='route-detail'),
    path('routes/add/', views.RouteAdd.as_view(), name='route-add'),
]

urlpatterns = format_suffix_patterns(urlpatterns)
