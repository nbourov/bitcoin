from django.urls import path

from . import views

urlpatterns = [
    path("login/", views.login, name = "login"),
    path("client-sign-up/", views.signup, name = "signup"),
    path("client/", views.client, name = "client"),
    path("trader/", views.trader, name = "trader"),
]
