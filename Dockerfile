# Użyj pełniejszego obrazu Pythona
FROM python:3.9-buster

# Ustaw katalog roboczy
WORKDIR /app

# Skopiuj plik z zależnościami
COPY requirements.txt .

# Instaluj zależności, zwiększając limity systemowe i ograniczając użycie pamięci cache
RUN ulimit -u 4096 -n 4096 && \
    pip install --upgrade pip && \
    pip install --no-cache-dir --no-parallel -r requirements.txt

# Skopiuj wszystkie pozostałe pliki projektu
COPY . .

# Zadeklaruj port, na którym nasłuchuje aplikacja
EXPOSE 5000

# Uruchom aplikację
CMD ["python", "app.py"]