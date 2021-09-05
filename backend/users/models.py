# user model
import uuid
from django.contrib.auth.models import AbstractBaseUser
from users.managers import UserManager
from django.db import models
from django.contrib.auth.models import BaseUserManager

class User(AbstractBaseUser):
    """
    Custom User model
    """
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    email = models.EmailField(
        max_length=255, unique=True, verbose_name="email address"
    )
    name = models.CharField("Name", max_length=20)
    is_staff = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)
    
    USERNAME_FIELD = "email"
    REQUIRED_FIELDS = ["name",]
    

    objects = UserManager()

    def __str__(self):
        return f"{self.name}"
    def get_short_name(self):
        # The user is identified by their email address
        return self.email

    def has_perm(self, perm, obj=None):
        "Does the user have a specific permission?"
        # Simplest possible answer: Yes, always
        return True

    def has_module_perms(self, app_label):
        "Does the user have permissions to view the app `app_label`?"
        # Simplest possible answer: Yes, always
        return True