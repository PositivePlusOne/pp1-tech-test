from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from app.core.app_config import settings
from app.database.database import engine, Base

import app.models

Base.metadata.create_all(bind= engine)


# App Setup
app = FastAPI(title=settings.PROJECT_NAME)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
async def root():
    return {"message": "Hello World"}