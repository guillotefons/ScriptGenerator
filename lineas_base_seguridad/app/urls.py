from django.conf.urls import url
from .views import index, download

urlpatterns = [
    url(r'^$', index.as_view(), name='index'),
    url(r'download/$', download, name='download'),
]