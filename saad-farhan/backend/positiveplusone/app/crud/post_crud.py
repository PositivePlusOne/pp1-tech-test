from app.models.post import Post
from app.schemas.posts_schema import PostCreate, PostUpdate
from app.crud.base import CRUDBase

class CRUDPost(CRUDBase[Post, PostCreate, PostUpdate]):
    pass

post_crud = CRUDPost(Post)
