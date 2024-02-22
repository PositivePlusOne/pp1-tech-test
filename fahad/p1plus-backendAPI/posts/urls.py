from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import CategoryViewSet, PostViewSet, CommentViewSet, LikeViewSet, CategoryListCreateAPIView, PostListCreateAPIView, CommentListCreateAPIView, LikeListCreateAPIView, CategoryDetailAPIView, PostDetailAPIView, CommentDetailAPIView, LikeDetailAPIView, HashTagViewSet, HashTagListCreateAPIView, HashTagDetailAPIView
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView


# Create a router and register viewsets with it
router = DefaultRouter()
router.register(r'categories', CategoryViewSet)
router.register(r'posts', PostViewSet)
router.register(r'comments', CommentViewSet)
router.register(r'likes', LikeViewSet)
router.register(r'hashtags', HashTagViewSet)

urlpatterns = [
    # Include router URLs
    path('', include(router.urls)),    
    path('api/token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('api/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('api/categories/', CategoryListCreateAPIView.as_view(), name='category-list-create'),
    path('api/categories/<int:pk>/', CategoryDetailAPIView.as_view(), name='category-detail'),  # Detail view for categories
    path('api/posts/', PostListCreateAPIView.as_view(), name='post-list-create'),
    path('api/posts/<int:pk>/', PostDetailAPIView.as_view(), name='post-detail'),  
    path('api/comments/', CommentListCreateAPIView.as_view(), name='comment-list-create'),
    path('api/comments/<int:pk>/', CommentDetailAPIView.as_view(), name='comment-detail'),  # Detail view for comments
    path('api/likes/', LikeListCreateAPIView.as_view(), name='like-list-create'),
    path('api/likes/<int:pk>/', LikeDetailAPIView.as_view(), name='like-detail'),  # Detail view for likes
    path('api/hashtags/', HashTagListCreateAPIView.as_view(), name='hashtag-list-create'),
    path('api/hashtags/<int:pk>/', HashTagDetailAPIView.as_view(), name='hashtag-detail'),  # Detail view for hashtags
]
