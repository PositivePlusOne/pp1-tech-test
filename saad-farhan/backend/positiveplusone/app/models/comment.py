from sqlalchemy import Column, String, ForeignKey, Integer, DateTime
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func
from app.database.database import Base

class Comment(Base):
    __tablename__ = "comments"
    id = Column(Integer, primary_key=True)
    content = Column(String)
    # Define the many-to-one relationship with Post
    post_id = Column(Integer, ForeignKey('posts.id'))
    post = relationship('Post', back_populates='comments')
    user_id = Column(Integer, ForeignKey('users.id'))
    user = relationship('User', back_populates='comments')
    time_created = Column(DateTime(timezone=True),
                          server_default=func.now(), nullable=False)
    time_updated = Column(DateTime(
        timezone=True), server_default=func.now(), onupdate=func.now(), nullable=False)