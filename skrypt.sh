#!/bin/bash

mkdir {Dokumenty,Praca\ inzynierska,Zadania\ UKOS}
mkdir Dokumenty/{Muzyka,Pliki\ tekstowe,Zaliczenie}
mkdir Zadania\ UKOS/{Cwiczenia\ 1,Cwiczenia\ 2,Kolo}
mkdir Zadania\ UKOS/Kolo/{Rozwiazanie,Tymczasowe}

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
	else
		echo "Nalezy podac 3 parametry: \"Rozwiazanie\" lub \"Tymczasowe\", nazwe pliku z rozszerzeniem i liczbe calkowita."
	fi
fi
