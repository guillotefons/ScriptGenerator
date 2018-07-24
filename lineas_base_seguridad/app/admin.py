from django.contrib import admin
from .models import *
from .forms import CapituloFormAdmin, SubCapituloFormAdmin

admin.site.register(SistemaOperativo)
admin.site.register(Capitulo, CapituloFormAdmin)
admin.site.register(SubCapitulo, SubCapituloFormAdmin)