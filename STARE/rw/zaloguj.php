<?php
// [login : [malpa21' -- ]
// [haslo :              ]
//
// {login : asdsfsdasda}
// {haslo :' OR 1=1 -- }
//
//{login:' OR user='bleach123' --}
//{haslo:afsddbdfdsadasdsadbdfbdf}
//
//{login:' OR id=4 -- }
//{haslo:aaaaaadasdas}
session_start();//start sesji
if((!isset($_POST['login'])) || (!isset($_POST['haslo'])))//jesli login i haslo sa puste nie przejdziemy recznie do zaloguj.php
{
    header('location:logowanie.php');
    exit();
}
require_once "con_database.php"; //zainkluduj raz php od bazy danych

$polaczenie = @new mysqli($host, $db_user, $db_password, $db_name); //ustala nowe polaczenie z baza danych

if($polaczenie->connect_error!=0) // jesli polaczenie sie nie udalo error
{
    echo "error: ".$polaczenie->connect_errno." Opis: ".$polaczenie->connect_error;
}
else
{
    $login = $_POST['login']; // zapisz haslo i login do zmiennej
    $haslo = $_POST['haslo'];

    $login = htmlentities($login, ENT_QUOTES, "UTF-8"); //przepusc login i haslo przez funkcje wykrywajaca oszustwo
    $haslo = htmlentities($haslo, ENT_QUOTES, "UTF-8");

    
    if ($rezultat = @$polaczenie->query(
        sprintf("SELECT * FROM uzytkownicy WHERE user='%s' AND pass='%s'",
        mysqli_real_escape_string($polaczenie,$login),
        mysqli_real_escape_string($polaczenie,$haslo)
        ))) // jesli uda sie przeslac zapytanie (haslo i login dodatkowe zabezpieczenie)
    {
        $ilu_userow = $rezultat->num_rows;
        if($ilu_userow>0)       //jesli znajdzie wiecej niz jeden kont z pasujacymy pasami
        {
            $_SESSION['zalogowany']=true;   //flaga sesyjna ze zalogowany

            $wiersz = $rezultat->fetch_assoc(); // wiersz = tablica asocjacyjna bazy
            $_SESSION['id'] = $wiersz['id'];
            $_SESSION['user'] = $wiersz['user'];
            $_SESSION['drewno'] = $wiersz['drewno'];
            $_SESSION['kamien'] = $wiersz['kamien'];
            $_SESSION['zboze'] = $wiersz['zboze'];
            $_SESSION['dnipremium'] = $wiersz['dnipremium'];
            $_SESSION['email'] = $wiersz['email']; // wyciaga dane z tablicy acjocyjnej
            
            unset($_SESSION['blad']);   //nie ustawiaj zmiennej sesyjnej 'blad'
            $rezultat->close(); //rozlacz zapytanie by uniknac wycieku danych

            header('location: gra.php');  //jesli dane pasuja , przenies do gra.php

        }
        else        //jesli dane nie pasuja ustaw zmienna sesyjna 'blad' i przenies do index.php
        {
            $_SESSION['blad'] = '<span style="color:red">Niepoprawny login lub haslo</span>';
            header('location:logowanie.php');
        }
    }

    $polaczenie->close();  //zakoncz polaczenie
}
?>