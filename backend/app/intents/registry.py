from app.intents.weather import get_weather

INTENT_REGISTRY: dict = {
    "get_weather": get_weather,
}