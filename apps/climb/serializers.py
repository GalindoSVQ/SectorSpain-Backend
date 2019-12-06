from rest_framework import serializers
from .models import Crag, Sector, Route


crag_url_detail = serializers.HyperlinkedIdentityField(
    view_name='climb-api:crag-detail',
    # lookup_field='name'
)


class CragSerializer(serializers.ModelSerializer):

    owner = serializers.ReadOnlyField(source='owner.get_full_name')
    province = serializers.CharField(source='get_province_display')
    pub_date = serializers.DateTimeField(format='%d/%m/%y')
    url = crag_url_detail

    class Meta:
        model = Crag
        fields = ['url', 'name', 'city', 'province', 'description', 'owner',
                  'id', 'latitude', 'longitude', 'pub_date']


class CragDetailSerializer(serializers.ModelSerializer):
    owner = serializers.ReadOnlyField(source='owner.get_full_name')
    province = serializers.CharField(source='get_province_display')
    pub_date = serializers.DateTimeField(format='%d/%m/%y')
    url = crag_url_detail

    class Meta:
        model = Crag
        fields = ['url', 'name', 'city', 'province', 'description', 'owner',
                  'id', 'latitude', 'longitude', 'pub_date']


class CragAddSerializer(serializers.ModelSerializer):

    class Meta:
        model = Crag
        fields = ['name', 'description', 'latitude',
                  'longitude', 'city', 'province']


class CragMapSerializer(serializers.ModelSerializer):

    province = serializers.CharField(source='get_province_display')

    class Meta:
        model = Crag
        fields = ['name', 'city', 'province', 'id', 'latitude', 'longitude']


class SectorSerializer(serializers.ModelSerializer):
    # picture = serializers.SerializerMethodField()

    class Meta:
        model = Sector
        fields = ['name', 'crag_id', 'description', 'parking_coordinates', 'latitude', 'longitude',
                  'id', 'orientation', 'picture', 'approach', 'warning', 'warning_text', 'rock_type', 'rope']

    # def get_picture(self, obj):
    #     try:
    #         picture = obj.picture.url
    #     except:
    #         picture = None
    #     return picture


class SectorAddSerializer(serializers.ModelSerializer):

    class Meta:
        model = Sector
        fields = ['name', 'description', 'latitude',
                  'longitude', 'orientation', 'picture', 'crag_id']


class RouteSerializer(serializers.ModelSerializer):

    class Meta:
        model = Route
        fields = ['name', 'grade', 'height',
                  'nanchor', 'rating', 'sector_id', 'id']


class RouteAddSerializer(serializers.ModelSerializer):

    class Meta:
        model = Route
        fields = ['name', 'description', 'grade',
                  'height', 'nanchor', 'sector_id']
