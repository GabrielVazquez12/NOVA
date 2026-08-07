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