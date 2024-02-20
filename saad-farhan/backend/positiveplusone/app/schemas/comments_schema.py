from pydantic import BaseModel, validator
from datetime import datetime

class CommentCreate(BaseModel):
    content: str
    post_id: int
    
class CommentUpdate(BaseModel):
    id: int
      
class CommentSchema(CommentCreate):
    id: int
    time_created: datetime
    time_updated: datetime
    
    class Config:
        orm_mode = True