from sqlalchemy import Column, String, ForeignKey, Integer, DateTime
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func
from app.database.database import Base

class Like(Base):
    __tablename__ = "likes"
    id = Column(Integer, primary_key=True)
    # Define the many-to-one relationship with Post
    post_id = Column(Integer, ForeignKey('posts.id'))
    post = relationship('Post', back_populates='likes')
    # Define the many-to-one relationship with User
    user_id = Column(Integer, ForeignKey('users.id'))
    user = relationship('User', back_populates='likes')
    time_created = Column(DateTime(timezone=True),
                          server_default=func.now(), nullable=False)
    time_updated = Column(DateTime(
        timezone=True), server_default=func.now(), onupdate=func.now(), nullable=False)