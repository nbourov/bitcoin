from django.urls import path

from .views import views

urlpatterns = [
    path("login/", views.login),
    path("client-sign-up/", views.signup),
    path("client/", views.client),
    path("trader/", views.trader),
]
