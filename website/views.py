
from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login
from django.contrib.auth.models import User
from django.contrib import messages

def home(request):
    return render(request, 'home.html')
def login(request):
    if request.method == "POST":
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            # redirect to a success page.
            return redirect('/success-url/')
        else:
            # Return a 'invalid login' error message.
            return render(request, 'login.html', {'error': 'Invalid username or password'})
    else:
        return render(request, 'login.html')



def signup(request):
    if request.method == 'POST':
        username = request.POST['username']
        password1 = request.POST['password1']
        password2 = request.POST['password2']

        if password1 == password2:
            try:
                User.objects.get(username=username)
                messages.error(request, 'Username already taken')
                return redirect('signup')
            except User.DoesNotExist:
                user = User.objects.create_user(username=username, password=password1)
                messages.success(request, 'User created successfully')
                return redirect('login')
        else:
            messages.error(request, 'Passwords must match')
            return redirect('signup')
    else:
        return render(request, 'signup.html')


