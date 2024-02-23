from app.models.comment import Comment
from app.schemas.comments_schema import CommentCreate, CommentUpdate
from app.crud.base import CRUDBase

class CRUDComment(CRUDBase[Comment, CommentCreate, CommentUpdate]):
    pass

comment_crud = CRUDComment(Comment)
