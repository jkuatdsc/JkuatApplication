import uuid
from django.contrib.auth.models import AbstractUser, PermissionsMixin
from django.db import models
from django.utils import timezone
from django.utils.translation import gettext_lazy as _
from .managers import CustomUserManager



# Create your models here.

class User(AbstractUser, PermissionsMixin):
    pkid = models.BigAutoField(primary_key=True, editable=False)
    id = models.CharField(default=uuid.uuid4, editable=False, max_length=36)
    username = models.CharField(verbose_name=_('Username'),max_length=250,
                                unique=True)
    first_name = models.CharField(verbose_name=_('First Name'),max_length=50)
    last_name = models.CharField(verbose_name=_('Last Name'),max_length=50)
    email = models.EmailField(verbose_name=_('Email Address'),unique=True)
    is_staff = models.BooleanField(verbose_name=_('Is Staff'),default=False)
    is_active = models.BooleanField(verbose_name=_('Is Active'),default=True)
    date_joined = models.DateTimeField(verbose_name=_('Date Joined'),default=timezone.now)
    
    
    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['username','first_name','last_name']
    
    
    objects = CustomUserManager()
    
    class Meta:
        verbose_name = _('User')
        verbose_name_plural = _('Users')
        ordering = ['-date_joined']
        
        
    def __str__(self):
        return self.username
    
    
    @property
    def get_full_name(self):
        return f"{self.first_name.title()} {self.last_name.title()}"
    
    def get_short_name(self):
        return self.username
    
