from pydantic import BaseModel
from datetime import datetime

class LikeCreate(BaseModel):
    post_id: int
    user_id: int
    
class LikeUpdate(BaseModel):
    id: int
      
class LikeSchema(LikeCreate):
    id: int
    time_created: datetime
    time_updated: datetime
    
    class Config:
        orm_mode = True