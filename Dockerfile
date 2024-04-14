# Użyj pełnego obrazu Pythona jako bazy
FROM python:3.9

# Ustawienie katalogu roboczego w kontenerze
WORKDIR /app

# Skopiuj plik z zależnościami do katalogu roboczego
COPY requirements.txt /app/

# Aktualizacja pip i instalacja zależności z ograniczeniem równoległego przetwarzania
RUN ulimit -u 4096 && \
    pip install --upgrade pip && \
    pip install --no-cache-dir --no-parallel -r requirements.txt

# Skopiuj pozostałe pliki aplikacji do kontenera
COPY . /app/

# Zadeklaruj port, na którym będzie działała aplikacja
EXPOSE 5000

# Polecenie uruchamiające aplikację
CMD ["python", "app.py"]