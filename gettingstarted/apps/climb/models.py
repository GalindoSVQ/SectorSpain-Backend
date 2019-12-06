import datetime
import uuid
from django.db import models
from django.utils import timezone
from django_utils.choices import Choice, Choices

class Crag(models.Model):
    
    #CHOICES
    class PROVINCES(Choices):
        Alava = Choice('Alava',('Álava'))
        Albacete = Choice('Albacete',('Albacete'))
        Alicante = Choice('Alicante',('Alicante'))
        Almeria = Choice('Almeria',('Almería'))
        Asturias = Choice('Asturias',('Asturias'))
        Avila = Choice('Avila',('Ávila'))
        Badajoz = Choice('Badajoz',('Badajoz'))
        BalearsIlles = Choice('Baleares',('Baleares'))
        Barcelona = Choice('Barcelona',('Barcelona'))
        Burgos = Choice('Burgos',('Burgos'))
        Caceres = Choice('Caceres',('Cáceres'))
        Cadiz = Choice('Cadiz',('Cádiz'))
        Cantabria = Choice('Cantabria',('Cantabria'))
        Castellon = Choice('Castellon',('Castellón'))
        Ceuta = Choice('Ceuta',('Ceuta'))
        CiudadReal = Choice('Ciudad Real',('Ciudad Real'))
        Cordoba = Choice('Cordoba',('Córdoba'))
        Coruna = Choice('Coruña',('Coruña, A'))
        Cuenca = Choice('Cuenca',('Cuenca'))
        Gipuzcoa = Choice('Gipuzcoa',('Guipúzcoa'))
        Gerona = Choice('Gerona',('Gerona'))
        Granada = Choice('Granada',('Granada'))
        Guadalajara = Choice('Guadalajara',('Guadalajara'))
        Huelva = Choice('Huelva',('Huelva'))
        Huesca = Choice('Huesca',('Huesca'))
        Jaen = Choice('Jaen',('Jaén'))
        Leon = Choice('Leon',('León'))
        Lerida = Choice('Lerida',('Lérida'))
        Lugo = Choice('Lugo',('Lugo'))
        Madrid = Choice('Madrid',('Madrid'))
        Malaga = Choice('Malaga',('Málaga'))
        Melilla = Choice('Melilla',('Melilla'))
        Murcia = Choice('Murcia',('Murcia'))
        Navarra = Choice('Navarra',('Navarra'))
        Orense = Choice('Orense',('Orense'))
        Palencia = Choice('Palencia',('Palencia'))
        Palmas = Choice('Palmas',('Palmas, Las'))
        Pontevedra = Choice('Pontevedra',('Pontevedra'))
        Rioja = Choice('Rioja',('Rioja, La'))
        Salamanca = Choice('Salamanca',('Salamanca'))
        Segovia = Choice('Segovia',('Segovia'))
        Sevilla = Choice('Sevilla',('Sevilla'))
        Soria = Choice('Soria',('Soria'))
        Tarragona = Choice('Tarragona',('Tarragona'))
        Tenerife = Choice('Tenerife',('Santa Cruz de Tenerife'))
        Teruel = Choice('Teruel',('Teruel'))
        Toledo = Choice('Toledo',('Toledo'))
        Valencia = Choice('Valencia',('Valencia'))
        Valladolid = Choice('Valladolid',('Valladolid'))
        Vizcaya = Choice('Vizcaya',('Vizcaya'))
        Zamora = Choice('Zamora',('Zamora'))
        Zaragoza = Choice('Zaragoza',('Zaragoza'))

    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    name = models.CharField(max_length=45)
    description = models.TextField(max_length=200, blank=True)
    latitude = models.CharField(max_length=45,blank=True,null=True)
    longitude = models.CharField(max_length=45,blank=True,null=True)
    city = models.CharField(max_length=45)
    province = models.CharField(max_length=25, choices=PROVINCES.choices, blank=False)
    pub_date = models.DateTimeField(auto_now_add=True)
    mod_date = models.DateTimeField(auto_now=True)
    owner = models.ForeignKey('users.User', on_delete=models.SET_NULL, null=True, blank=True)

    def __str__(self):
        return self.name

    def get_name_crag(self):
        """
        Returns the name of the crag.
        """
        name_crag = '%s' % (self.name)
        return name_crag.strip()


class Sector(models.Model):

    #CHOICES 
    ORIENTATIONS = (('N','NORTE'),('NE','NORESTE'),('E','ESTE'),('SE','SURESTE'),('S','SUR'),('SO','SUROESTE'),('O','OESTE'),('NO','NOROESTE'))

    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    name = models.CharField(max_length=45)
    crag_id = models.ForeignKey('Crag',on_delete=models.CASCADE,)
    description = models.TextField()
    parking_coordinates = models.CharField(max_length=45,blank=True)
    latitude = models.CharField(max_length=45,blank=True,null=True)
    longitude = models.CharField(max_length=45,blank=True,null=True)
    orientation = models.CharField(max_length=2, choices=ORIENTATIONS, blank=True)
    picture = models.FileField(blank=True, null=True, upload_to='media/')
    approach = models.TextField(blank=True)
    rope = models.IntegerField(blank=True,null=True)
    warning = models.BooleanField(default=False,blank=True)
    warning_text = models.TextField(blank=True)
    pub_date = models.DateTimeField(auto_now_add=True)
    mod_date = models.DateTimeField(auto_now=True)
    owner = models.ForeignKey('users.User', on_delete=models.SET_NULL, null=True, blank=True)
    rock_type = models.CharField(max_length=45,blank=True)

    def __str__(self):
        return self.name



class Route(models.Model):

    # CHOICES 
    GRADES = (('?','?'),('5','5'),('6a','6a'),('6a+','6a+'),('6b','6b'),('6b+','6b+'),('6c','6c'),('6c+','6c+'),('7a','7a'),('7a+','7a+'),('7b','7b'),('7b+','7b+'),('7c','7c'),('7c+','7c+'),('8a','8a'),('8a+','8a+'),('8b','8b'),('8b+','8b+'),('8c','8c'),('8c+','8c+'),('9a','9a'),('9a+','9a+'),('9b','9b'),('9b+','9b+'),('9c','9c'))
    RATINGS = (('1','1'),('2','2'),('3','3'),('4','4'),('5','5'))

    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    name = models.CharField(max_length=45)
    sector_id = models.ForeignKey('Sector',on_delete=models.CASCADE,)
    description = models.TextField(blank=True)
    grade = models.CharField(max_length=10,choices=GRADES)
    rating = models.CharField(max_length=1,choices=RATINGS,blank=True)
    height = models.IntegerField(blank=True,null=True)
    nanchor = models.IntegerField(blank=True,null=True)
    anchor_type = models.CharField(max_length=15,blank=True)
    lowering_station = models.CharField(max_length=20,blank=True)
    pith = models.IntegerField(blank=True,null=True)
    feature = models.TextField(blank=True)
    photo = models.ImageField(blank=True)
    pub_date = models.DateTimeField(auto_now_add=True)
    mod_date = models.DateTimeField(auto_now=True)   
    owner = models.ForeignKey('users.User', on_delete=models.SET_NULL, null=True, blank=True)

    def __str__(self):
        return self.name
    
