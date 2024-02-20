from typing import Any, Dict, Generic, List, Type, TypeVar, Union

from fastapi.encoders import jsonable_encoder
from pydantic import BaseModel
from sqlalchemy.orm import Session
from app.database.database import Base

ModelType = TypeVar("ModelType", bound=Base)
CreateSchemaType = TypeVar("CreateSchemaType", bound=BaseModel)
UpdateSchemaType = TypeVar("UpdateSchemaType", bound=BaseModel)


class CRUDBase(Generic[ModelType, CreateSchemaType, UpdateSchemaType]):
    def __init__(self, model: Type[ModelType]) -> None:
        self.model = model

    def get(self, db: Session, id: int) -> Union[ModelType, None]:
        return db.query(self.model).get(id)

    def get_multi(self, db: Session, *, offset: int = 0, limit: int = 10) -> List[ModelType]:
        return db.query(self.model).order_by(self.model.id.desc()).offset(offset).limit(limit).all()

    def get_all(self, db: Session) -> List[ModelType]:
        return db.query(self.model).order_by(self.model.id.desc()).all()

    def create(self, db: Session, *, create_schema: CreateSchemaType, commit: bool = True) -> ModelType:
        create_obj = jsonable_encoder(create_schema)
        relevant_keys = {k: v for k, v in create_obj.items(
        ) if k in self.model.__table__.columns}
        db_obj = self.model(**relevant_keys)
        db.add(db_obj)
        if commit:
            db.commit()
        db.refresh(db_obj)
        return db_obj

    def update(self, db: Session, *, db_obj: ModelType, update_schema: Union[UpdateSchemaType, Dict[str, Any]], commit: bool = True) -> ModelType:
        obj_data = jsonable_encoder(db_obj)
        if isinstance(update_schema, dict):
            update_data = update_schema
        else:
            update_data = update_schema.dict(exclude_unset=True)
        for field in obj_data:
            if field in update_data:
                setattr(db_obj, field, update_data[field])
        db.add(db_obj)
        if commit:
            db.commit()
        db.refresh(db_obj)
        return db_obj

    def remove(self, db: Session, *, id: int, commit: bool = True) -> ModelType:
        obj = db.query(self.model).get(id)
        db.delete(obj)
        if commit:
            db.commit()
        return obj

    def get_count(self, db: Session) -> int:
        return db.query(self.model).count()

    def get_by_ids(self, db: Session, ids: List[int]) -> List[ModelType]:
        return db.query(self.model).filter(self.model.id.in_(ids)).all()