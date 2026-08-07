from pydantic_settings import BaseSettings

class Settings(BaseSettings):
    weather_api_key: str = ""
    weather_default_city: str = "Saltillo,MX"

    class Config:
        env_file = ".env"

settings = Settings()