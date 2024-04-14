# Użyj oficjalnego obrazu Pythona 3.9 jako bazy
FROM python:3.9-slim

# Ustawienie katalogu roboczego w kontenerze
WORKDIR /app

# Skopiuj plik z zależnościami do katalogu roboczego
COPY requirements.txt /app/

# Zaktualizuj pip i zainstaluj zależności
# Usunięcie cache i ograniczenie użycia równoległych wątków
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Skopiuj pozostałe pliki aplikacji do kontenera
COPY . /app/

# Zadeklaruj port, na którym będzie działała aplikacja
EXPOSE 5000

# Polecenie uruchamiające aplikację
CMD ["python", "app.py"]