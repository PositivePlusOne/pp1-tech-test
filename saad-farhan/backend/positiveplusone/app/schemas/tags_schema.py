from pydantic import BaseModel, validator
from typing import Union, List
from datetime import date, datetime

class TagsCreate(BaseModel):
    content: str
    
class TagsUpdate(TagsCreate):
    id: int
    
class TagSchema(TagsCreate):
    id: int
    
    class Config:
        orm_mode = True