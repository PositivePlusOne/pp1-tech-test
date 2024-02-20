from fastapi import APIRouter, HTTPException, Depends, status
from app.schemas.posts_schema import PostSchema, PostCreate
from sqlalchemy.orm import Session
from app.database.database import get_db

post_router = APIRouter()

@post_router.post("/post", response_model=PostSchema)
def create_post(post: PostCreate, db: Session = Depends(get_db)):
    try:
        with db.begin():
            pass
    except Exception as e:
        return HTTPException(f"Internal server error {e}")
    finally:
        db.close()