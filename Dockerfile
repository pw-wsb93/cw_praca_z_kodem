# Użyj oficjalnego obrazu Pythona jako obrazu bazowego
FROM python:3.8-slim

# Ustaw katalog roboczy w kontenerze
WORKDIR /app

# Skopiuj plik requirements.txt do katalogu roboczego
COPY requirements.txt .

# Zainstaluj potrzebne pakiety
RUN pip install --no-cache-dir -r requirements.txt

# Skopiuj wszystkie pliki z bieżącego katalogu do katalogu roboczego
COPY . .

# Zadeklaruj, że kontener będzie słuchał na porcie 5000
EXPOSE 5000

# Uruchom aplikację Flask przy starcie kontenera
CMD ["flask", "run", "--host=0.0.0.0"]