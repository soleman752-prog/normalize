#!/bin/bash

PROGRAM_NAME="normalize"
SOURCE_FILE="normalize.c"

read -p "Podaj absolutną ścieżkę instalacji: " INSTALL_PATH

if [ ! -d "$INSTALL_PATH" ] || [ ! -w "$INSTALL_PATH" ]; then
    echo "Błąd: katalog nie istnieje lub brak uprawnień do zapisu"
    exit 1
fi

gcc -Wall -Wextra -o $PROGRAM_NAME $SOURCE_FILE
if [ $? -ne 0 ]; then
    echo "Błąd kompilacji"
    exit 1
fi

mv $PROGRAM_NAME "$INSTALL_PATH"
if [ $? -ne 0 ]; then
    echo "Nie udało się przenieść pliku"
    exit 1
fi

# Instrukcja dla użytkownika
echo
echo "Instalacja zakończona."
echo "Aby dodać program do PATH, wykonaj:"
echo
echo "export PATH=\$PATH:$INSTALL_PATH"
echo
