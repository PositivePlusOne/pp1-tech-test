from pydantic import BaseModel, validator
from typing import Union, List
from datetime import date, datetime

class UserCreate(BaseModel):
    first_name: str
    last_name: str
    user_name: str
    email: str

class UserUpdate(UserCreate):
    id: int
    
class UserSchema(UserCreate):
    id: int
    
    class Config:
        orm_mode = True