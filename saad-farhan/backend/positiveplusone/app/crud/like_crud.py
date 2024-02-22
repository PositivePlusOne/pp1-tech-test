from app.models.like import Like
from app.schemas.like_schema import LikeCreate, LikeUpdate
from app.crud.base import CRUDBase

class CRUDComment(CRUDBase[Like, LikeCreate, LikeUpdate]):
    pass

like_crud = CRUDComment(Like)
