from django.contrib.auth.base_user import BaseUserManager
from django.utils.translation import ugettext_lazy as _


class UserManager(BaseUserManager):
    """
    Custom User Manager to use email as unique identifier
    """

    def create_user(self, email, name, password=None):
        if not email:
            raise ValueError("Email address required")

        user = self.model(
            email=self.normalize_email(email),
            name=name,
        )
        user.is_active = True
        user.set_password(password)
        user.save(using=self._db)
        return user
