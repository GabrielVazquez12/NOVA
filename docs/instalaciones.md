## pydantic-settings
- **Qué es:** extensión de Pydantic especializada en leer configuración desde variables de entorno o archivos .env
- **Para qué lo uso:** cargar la configuración del backend (API keys, URLs, etc.) sin escribirlas directo en el código
- **Instalado:** `pip install pydantic-settings`
- **Versión:** 2.14.2

## python-dotenv
- **Qué es:** librería que lee archivos `.env` y carga su contenido como variables de entorno
- **Para qué lo uso:** se instaló automático como dependencia de pydantic-settings — es lo que realmente "lee" el archivo .env por debajo
- **Instalado:** se instaló solo, junto con pydantic-settings
- **Versión:** 1.2.2

## fastapi
- **Qué es:** framework de Python para construir APIs web
- **Para qué lo uso:** es el backend que va a recibir los comandos (texto/voz) y regresar respuestas
- **Instalado:** `pip install fastapi`
- **Versión:** 0.141.1

## uvicorn
- **Qué es:** servidor ASGI — el programa que realmente "levanta" y corre tu app de FastAPI, poniéndola a escuchar peticiones en un puerto
- **Para qué lo uso:** sin esto, FastAPI es solo código definido, no algo corriendo de verdad
- **Instalado:** `pip install uvicorn`
- **Versión:** 0.52.1

## google-genai
- **Qué es:** SDK oficial de Python de Google para hablar con los modelos Gemini
- **Para qué lo uso:** conectar el backend con el LLM (function calling) para que NOVA decida qué acción ejecutar
- **Instalado:** `pip install google-genai`
- **Versión:** (revisa con `pip show google-genai`)

## http (Flutter/Dart)
- **Qué es:** paquete oficial de Dart para hacer peticiones HTTP
- **Para qué lo uso:** conectar la app Flutter con el backend FastAPI (endpoint /chat)
- **Instalado:** `flutter pub add http`
- **Versión:** 1.6.0

## flutter_tts (Flutter/Dart)
- **Qué es:** paquete que da acceso al motor de texto-a-voz (TTS) nativo del sistema operativo
- **Para qué lo uso:** que NOVA "hable" sus respuestas en voz alta, en vez de solo mostrarlas en texto
- **Instalado:** `flutter pub add flutter_tts`
- **Versión:** 4.2.5