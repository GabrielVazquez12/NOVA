from google import genai
from google.genai import types

from app.core.config import settings
from app.intents.registry import INTENT_REGISTRY

client = genai.Client(api_key=settings.gemini_api_key)

get_weather_declaration = types.FunctionDeclaration(
    name="get_weather",
    description="Obtiene el clima actual de una ciudad",
    parameters={
        "type": "object",
        "properties": {
            "city": {
                "type": "string",
                "description": "Nombre de la ciudad, ej. Saltillo,MX",
            }
        },
        "required": ["city"],
    },
)

tools = types.Tool(function_declarations=[get_weather_declaration])
config = types.GenerateContentConfig(tools=[tools])

def ask_llm(user_text: str) -> str:
    response = client.models.generate_content(
        model="gemini-3.6-flash",
        contents=user_text,
        config=config,
    )
    part = response.candidates[0].content.parts[0]

    if part.function_call is None:
        return response.text

    function_name = part.function_call.name
    function_args = part.function_call.args

    function_to_call = INTENT_REGISTRY[function_name]
    result = function_to_call(**function_args)

    return result