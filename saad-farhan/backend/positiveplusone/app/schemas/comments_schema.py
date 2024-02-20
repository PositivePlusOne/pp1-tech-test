from pydantic import BaseModel, validator
from typing import Union, List
from datetime import date, datetime

class CommentCreate(BaseModel):
    content: str
    
class CommentUpdate(BaseModel):
    id: int
      
class CommentSchema(CommentCreate):
    id: int
    
    class Config:
        orm_mode = True