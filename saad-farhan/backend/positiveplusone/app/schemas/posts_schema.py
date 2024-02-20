from pydantic import BaseModel, validator
from typing import Union, List
from datetime import date, datetime
from app.schemas.tags_schema import TagsCreate
from app.schemas.comments_schema import CommentSchema

class PostCreate(BaseModel):
    caption: str
    image_uri: Union[str, None]
    user_id: int
    tags: Union[List[TagsCreate], None]
    
class PostUpdate(PostCreate):
    id: int
    
class PostSchema(PostCreate):
    id: int
    comments: Union[None, List[CommentSchema]]
    
    class Config:
        orm_mode = True