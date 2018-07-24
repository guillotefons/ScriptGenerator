# -*- coding: utf-8 -*-
from django.shortcuts import render_to_response
from django.views.generic import ListView
from app.models import *


class index(ListView):
    model = SistemaOperativo
    template_name = 'form.html'


def download(request):
    sistema_operativo = SistemaOperativo.objects.get(pk=request.POST.get('so'))
    capitulos = sistema_operativo.capitulo_set.all()
    data = []
    
    for capitulo in capitulos:
        subcapitulos = []
        for subcapitulo in sistema_operativo.subcapitulo_set.filter(capitulo = capitulo):
            subcapitulos.append(subcapitulo)
        
        data.append({'capitulo' : capitulo.nombre, 'subcapitulos' : subcapitulos})  
        
    response = render_to_response('download.html', {'sistema_operativo': sistema_operativo, 'data': data})
    response['Content-Type'] = 'text/plain; charset=utf-8'
    response['Content-Disposition'] = 'attachment; filename=%s_script.sh' % sistema_operativo.nombre.replace(" ", "_")
    
    return response

