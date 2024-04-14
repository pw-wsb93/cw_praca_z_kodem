# Użyj oficjalnego obrazu Pythona jako bazy
FROM python:3.9-slim

# Ustawienie katalogu roboczego w kontenerze
WORKDIR /app

# Skopiuj plik z zależnościami do katalogu roboczego
COPY requirements.txt .

# Zainstaluj zależności
RUN pip install -r requirements.txt

# Skopiuj wszystkie pliki z bieżącego katalogu do katalogu roboczego
COPY . .

# Zadeklaruj port, na którym będzie działała aplikacja
EXPOSE 5000

# Polecenie uruchamiające aplikację
CMD ["python", "app.py"]