from fastapi import APIRouter, HTTPException, Depends, status
from app.schemas.posts_schema import PostSchema, PostCreate, PostList
from app.schemas.comments_schema import CommentCreate
from app.schemas.user_schema import UserCreate, UserSchema
from app.crud.post_crud import post_crud
from app.crud.tags_crud import tag_crud
from app.crud.comments_crud import comment_crud
from app.crud.user_crud import user_crud


from typing import List
from sqlalchemy.orm import Session
from app.database.database import get_db

post_router = APIRouter()

@post_router.post("/user", response_model=UserSchema)
def create_post(user: UserCreate, db: Session = Depends(get_db)):
    try:
        # Create User
        return user_crud.create(db, create_schema=user)
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Internal server error: {e}")

@post_router.post("/post", response_model=PostSchema)
def create_post(post: PostCreate, db: Session = Depends(get_db)):
    try:
        # Create Post
        post_db = post_crud.create(db, create_schema=post)
        # Create and add tags to the post
        for tag in post.tags:
            tag.post_id = post_db.id
            tag_crud.create(db, create_schema=tag)
        return post_db
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Internal server error: {e}")
    
@post_router.get("/posts/{offset}/{limit}")
def get_posts(offset:int, limit: int, db: Session = Depends(get_db)):
    # Get posts using pagination
    try:
        return PostList(posts=post_crud.get_multi(db, offset=offset, limit=limit), count=post_crud.get_count(db))
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Internal server error: {e}")
    
@post_router.post("/post/comment")
def add_comment_to_a_post(comment: CommentCreate, db: Session = Depends(get_db)):
    # Add Comments to a post
    try:
        comment_db = comment_crud.create(db, create_schema=comment)
        return comment_db
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Internal server error: {e}")
    