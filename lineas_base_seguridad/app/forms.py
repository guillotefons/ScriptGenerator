# -*- coding: utf-8 -*-
from django import forms
from .models import Capitulo, SubCapitulo
from django.contrib import admin


class CapituloForm(forms.ModelForm):    
    
    class Meta:
        model = Capitulo
        
        fields = ['nombre', 'descripcion', 'sistema_operativo']
        
        widgets = {
            'sistema_operativo': forms.CheckboxSelectMultiple(),
        } 


class CapituloFormAdmin(admin.ModelAdmin):    
    
    list_display = ('nombre', 'descripcion', 'sistemas_operativos')
    search_fields = ['nombre', 'descripcion', ]
    
    form = CapituloForm


class SubCapituloForm(forms.ModelForm):

    class Meta:
        model = SubCapitulo
        
        fields = ['nombre', 'capitulo', 'sistema_operativo', 'comandos', 'descripcion']  
        
        labels = {
            'capitulo' : 'Categoría de configuración',
        }
        
        widgets = {
            'sistema_operativo': forms.CheckboxSelectMultiple(),
        }   


class SubCapituloFormAdmin(admin.ModelAdmin):
    list_display = ('nombre', 'categorias_de_configuracion', 'sistemas_operativos')
    search_fields = ['nombre', 'capitulo', ]
    
    form = SubCapituloForm
