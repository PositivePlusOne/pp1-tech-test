from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from app.core.app_config import settings
from app.database.database import engine, Base
from app.routes.post_routes import post_router

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

app.include_router(post_router, prefix=settings.API_V1_STR)
@app.get("/")
async def root():
    return {"message": "Hello World"}