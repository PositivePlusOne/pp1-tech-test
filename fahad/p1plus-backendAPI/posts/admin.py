
from django.contrib import admin
from .models import Category, Post, Comment, Like, HashTag

@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    pass

@admin.register(Post)
class PostAdmin(admin.ModelAdmin):
    pass

@admin.register(Comment)
class CommentAdmin(admin.ModelAdmin):
    pass

@admin.register(Like)
class LikeAdmin(admin.ModelAdmin):
    pass

@admin.register(HashTag)
class HashTagAdmin(admin.ModelAdmin):
    pass
