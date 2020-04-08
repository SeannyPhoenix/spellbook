from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('spells/', views.spells, name='spells'),
    path('spells/create', views.spell_create, name='create'),
    path('spells/<str:spell_name>', views.spell_detail, name='detail'),
]
