from django.contrib import admin
from .models import Spell, School, PCClass, ClassSpells

# Register your models here.
admin.site.register(Spell)
admin.site.register(School)
admin.site.register(PCClass)
admin.site.register(ClassSpells)
