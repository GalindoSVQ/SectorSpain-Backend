from django.db.models import Q
from django.shortcuts import render
from .models import (
    Crag,
    Sector,
    Route)
from .serializers import (
    CragSerializer,
    CragAddSerializer,
    CragMapSerializer,
    SectorSerializer,
    SectorAddSerializer,
    RouteSerializer,
    RouteAddSerializer)

from .pagination import (
    CustomLimitOffsetPagination,
    CustomPageNumberPagination)

from rest_framework.filters import (
    SearchFilter,
    OrderingFilter)

from rest_framework import (
    generics,
    permissions)

from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework.reverse import reverse
from rest_framework.pagination import (
    LimitOffsetPagination,
    PageNumberPagination)


class CragsList(generics.ListCreateAPIView):
    # queryset = Crag.objects.all()
    serializer_class = CragSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    filter_backends = [OrderingFilter]
    pagination_class = CustomPageNumberPagination

    def perfom_create(self, serializer):
        serializer.save(owner=self.request.user)

    def get_queryset(self, *args, **kwargs):
        queryset_list = Crag.objects.all()
        query_province = self.request.GET.get("province")
        query_name = self.request.GET.get("cragName")

        if query_province:
            queryset_list = queryset_list.filter(
                province__icontains=query_province
            )
        if query_name:
            queryset_list = queryset_list.filter(
                name__icontains=query_name
            )
        return queryset_list


class CragsAdd(generics.CreateAPIView):
    serializer_class = CragAddSerializer
    permission_classes = [permissions.IsAuthenticated]

    def perfom_create(self, serializer):
        serializer.save(owner=self.request.User)


class CragDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Crag.objects.all()
    serializer_class = CragSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    pagination_class = CustomPageNumberPagination


class CragMap(generics.ListAPIView):
    queryset = Crag.objects.all()
    serializer_class = CragMapSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    # pagination_class = CustomPageNumberPagination


class SectorList(generics.ListCreateAPIView):
    # queryset = Sector.objects.all()
    serializer_class = SectorSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    pagination_class = CustomPageNumberPagination

    def get_queryset(self, *args, **kwargs):
        queryset_list = Sector.objects.all()
        query_cragID = self.request.GET.get("cragID")
        query_name = self.request.GET.get("sectorName")

        if query_cragID:
            queryset_list = queryset_list.filter(
                crag_id__exact=query_cragID
            )
        if query_name:
            queryset_list = queryset_list.filter(
                name__exact=query_name
            )
        return queryset_list


class SectorDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Sector.objects.all()
    serializer_class = SectorSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    pagination_class = CustomPageNumberPagination


class SectorAdd(generics.CreateAPIView):
    serializer_class = SectorAddSerializer
    permission_classes = [permissions.IsAuthenticated]

    def perfom_create(self, serializer):
        serializer.save(owner=self.request.User)


class RouteList(generics.ListCreateAPIView):
    # queryset = Route.objects.all()
    serializer_class = RouteSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    pagination_class = CustomPageNumberPagination

    def get_queryset(self, *arg, **kwargs):
        queryset_list = Route.objects.all()
        query = self.request.GET.get("sectorID")
        if query:
            queryset_list = queryset_list.filter(
                sector_id__exact=query
            )
        return queryset_list


class RouteDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Route.objects.all()
    serializer_class = RouteSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    pagination_class = CustomPageNumberPagination


class RouteAdd(generics.CreateAPIView):
    serializer_class = RouteAddSerializer
    permission_classes = [permissions.IsAuthenticated]

    def perfom_create(self, serializer):
        serializer.save(owner=self.request.User)
