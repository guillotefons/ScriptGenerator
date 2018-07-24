# -*- coding: utf-8 -*-
from django.db import models


class SistemaOperativo(models.Model):
    nombre = models.CharField(max_length=40)
    descripcion = models.TextField(blank=True)

    def __str__(self):
        return '{}'.format(self.nombre)
    
    class Meta:
        verbose_name = 'Sistema Operativo'
        verbose_name_plural = '1. Parametrización de Sistemas Operativos'

    
class Capitulo(models.Model):
    nombre = models.CharField(max_length=250)
    descripcion = models.TextField(blank=True)
    sistema_operativo = models.ManyToManyField(SistemaOperativo)
    
    def sistemas_operativos(self):
        return ', '.join([str(os) for os in self.sistema_operativo.all()])
    
    def __str__(self):
        return '{}'.format(self.nombre)
    
    class Meta:
        verbose_name = 'Categoría de configuración'
        verbose_name_plural = '2. Parametrización de categorías de configuración'


class SubCapitulo(models.Model):
    nombre = models.CharField(max_length=250)
    capitulo = models.ForeignKey(Capitulo, null=False, blank=False) 
    sistema_operativo = models.ManyToManyField(SistemaOperativo, blank=True)
    comandos = models.TextField(blank=False)
    descripcion = models.TextField(blank=True)
    
    def sistemas_operativos(self):
        return ', '.join([str(os) for os in self.sistema_operativo.all()])
    
    def categorias_de_configuracion(self):
        return self.capitulo
    
    def __str__(self):
        return '{}'.format(self.nombre)
    
    class Meta:
        verbose_name = 'Comandos para auditar configuración'
        verbose_name_plural = '3. Parametrización de comandos para auditar configuraciones'
    
