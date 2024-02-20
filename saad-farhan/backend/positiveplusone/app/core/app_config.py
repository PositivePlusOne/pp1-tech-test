from pydantic import BaseSettings
import os
from dotenv import load_dotenv

class Settings(BaseSettings):
    # Load environment variables from .env file
    load_dotenv()

    # Project variables
    PROJECT_NAME: str = "positiveplusone"
    API_V1_STR: str = "/api/v1"
    LOGGER_NAME: str = "positiveplusone"

    SQLALCHEMY_DATABASE_URI: str = os.getenv('SQLALCHEMY_DATABASE_URI')



settings = Settings()