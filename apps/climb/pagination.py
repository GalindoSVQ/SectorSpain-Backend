from rest_framework.pagination import (
    LimitOffsetPagination,
    PageNumberPagination
)


class CustomLimitOffsetPagination(LimitOffsetPagination):
    default_limit = 10
    max_limit = 10


class CustomPageNumberPagination(PageNumberPagination):
    page_size = 4
