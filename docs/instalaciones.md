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
