#!/bin/bash

mkdir {Dokumenty,Praca\ inzynierska,Zadania\ UKOS}
mkdir Dokumenty/{Muzyka,Pliki\ tekstowe,Zaliczenie}
mkdir Zadania\ UKOS/{Cwiczenia\ 1,Cwiczenia\ 2,Kolo}
mkdir Zadania\ UKOS/Kolo/{Rozwiazanie,Tymczasowe}

dane="HDD 420 310
HDD 320 280
SSD 300 210
HDD 890 270
M2 890 320
SSD 600 270
HDD 750 180
HDD 930 320
M2 440 220
M2 940 330
HDD 450 220
M2 530 180
HDD 620 330
SSD 480 260
HDD 670 340
HDD 640 190
M2 980 260
M2 820 190
HDD 350 330
SSD 410 170
SSD 390 280
SSD 340 270
M2 540 190
SSD 740 220
HDD 700 330
M2 220 330
HDD 960 220
SSD 270 270
M2 790 310
SSD 480 250
SSD 840 340
M2 690 330
SSD 880 290
HDD 830 310
SSD 890 200
M2 580 230
SSD 880 240
M2 620 220
SSD 540 200
HDD 920 170
M2 390 170
HDD 270 190
SSD 970 240
M2 200 220
M2 480 170
HDD 380 240
M2 250 280"

p1regex="^(Rozwiazanie|Tymczasowe)$"
p2regex="^.+\..+$"
p3regex="^[+-]?[0-9]+$"


if [ $# != 3 ]
then
	echo "Nalezy podac 3 parametry."
else
	if [[ $1 =~ $p1regex ]] && [[ $2 =~ $p2regex ]] && [[ $3 =~ $p3regex ]]
	then
		touch Zadania\ UKOS/Kolo/$1/$2
		echo "[Rodzaj dysku]	[Pojemność]	[Cena]" > Zadania\ UKOS/Kolo/$1/$2
		echo "$dane" >> Zadania\ UKOS/Kolo/$1/$2
		
		touch Praca\ inzynierska/{SSD.txt,HDD.txt,M2.txt}
		egrep '^SSD' Zadania\ UKOS/Kolo/$1/$2 > Praca\ inzynierska/SSD.txt
		egrep '^HDD' Zadania\ UKOS/Kolo/$1/$2 > Praca\ inzynierska/HDD.txt
		egrep '^M2' Zadania\ UKOS/Kolo/$1/$2 > Praca\ inzynierska/M2.txt
		
		cp **/*.txt Dokumenty/Pliki\ tekstowe
		
		touch Dokumenty/Pliki\ tekstowe/Wybrane\ dyski.txt
		head -$3 Praca\ inzynierska/SSD.txt > Dokumenty/Pliki\ tekstowe/Wybrane\ dyski.txt
		head -$3 Praca\ inzynierska/HDD.txt >> Dokumenty/Pliki\ tekstowe/Wybrane\ dyski.txt
		head -$3 Praca\ inzynierska/M2.txt >> Dokumenty/Pliki\ tekstowe/Wybrane\ dyski.txt
	else
		echo "Nalezy podac 3 parametry: \"Rozwiazanie\" lub \"Tymczasowe\", nazwe pliku z rozszerzeniem i liczbe calkowita."
	fi
fi
