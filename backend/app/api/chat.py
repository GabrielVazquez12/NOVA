from fastapi import APIRouter
from pydantic import BaseModel

class ChatRequest(BaseModel):
    text: str

class ChatResponse(BaseModel):
    reply: str

router = APIRouter(prefix = "/chat", tags=["chat"])

@router.post("", response_model = ChatResponse)
def chat(request: ChatRequest) -> ChatResponse:
    return ChatResponse(reply=f"recibi: {request.text}")