from pydantic import BaseModel, validator
from typing import Union, List
from datetime import date, datetime

class TagsCreate(BaseModel):
    content: str
    post_id: Union[None, int]
    
class TagsUpdate(TagsCreate):
    id: int
    
class TagSchema(TagsCreate):
    post_id: int
    id: int
    
    class Config:
        orm_mode = True