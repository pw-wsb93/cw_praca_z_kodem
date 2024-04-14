# Użyj pełnego obrazu Pythona jako bazy, co może zawierać więcej narzędzi systemowych i bibliotek
FROM python:3.9

# Ustawienie katalogu roboczego w kontenerze
WORKDIR /app

# Skopiuj plik z zależnościami do katalogu roboczego
COPY requirements.txt /app/

# Aktualizacja pip, ograniczenie użycia pamięci cache i zwiększenie liczby dozwolonych wątków
RUN pip install --upgrade pip && \
    pip install --no-cache-dir --no-parallel -r requirements.txt

# Skopiuj pozostałe pliki aplikacji do kontenera
COPY . /app/

# Zadeklaruj port, na którym będzie działała aplikacja
EXPOSE 5000

# Polecenie uruchamiające aplikację
CMD ["python", "app.py"]