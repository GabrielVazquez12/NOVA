from fastapi import FastAPI
from app.api import chat

app = FastAPI(title = "Nova Backend" )
app.include_router(chat.router)

@app.get("/health")
def health():
    return {"status": "ok"}