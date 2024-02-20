from app.models.user import User
from app.schemas.user_schema import UserCreate, UserUpdate
from app.crud.base import CRUDBase

class CRUDUser(CRUDBase[User, UserCreate, UserUpdate]):
    pass

user_crud = CRUDUser(User)
