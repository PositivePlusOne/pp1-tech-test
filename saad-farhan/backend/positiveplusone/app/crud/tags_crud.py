from app.models.tag import Tag
from app.schemas.tags_schema import TagsCreate, TagsUpdate
from app.crud.base import CRUDBase

class CRUDTag(CRUDBase[Tag, TagsCreate, TagsUpdate]):
    pass

tag_crud = CRUDTag(Tag)
