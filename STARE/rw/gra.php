<?php 
    session_start(); 
    if(!isset($_SESSION['zalogowany']))
    {
        header('location:index.php');
        exit();
    }
?>
<!DOCTYPE html>
<html lang=pl>
    <head>
        <meta charset = "utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
        <title>Osadnicy gra</title>
        <script type="text/javascript">
            function odliczanie()
            {
                var dzisiaj = new Date();

                var dzien = dzisiaj.getDate();
                var miesiac = dzisiaj.getMonth()+1;
                var rok = dzisiaj.getFullYear();

                var godzina = dzisiaj.getHours();
                var minuta = dzisiaj.getMinutes();
                var sekunda = dzisiaj.getSeconds();

                if (godzina < 10) godzina = "0"+godzina;
                if (minuta < 10) minuta = "0"+minuta;
                if (sekunda < 10) godzina = "0"+sekunda;

                document.getElementById("zegar").innerHTML = 
                dzien+"/"+miesiac+"/"+rok+" | "+godzina+":"+minuta+":"+sekunda;

                setTimeout(odliczanie, 1000);
            }
        </script>

    </head>
    <body onload="odliczanie();">               
            <h1>Gra</h1>
            <div id="zegar"></div></br>
            <a href="wyloguj.php"> Wyloguj</a>        
        <?php
echo<<<END
        <p>Witaj {$_SESSION['user']} !</br></br>
        <b>drewno - </b>{$_SESSION['drewno']} <b>kamien - </b>{$_SESSION['kamien']} <b>zboze - </b>{$_SESSION['zboze']}</br></br>
        <b>email:</b> {$_SESSION['email']}</br>
        pozostalo: <b>{$_SESSION['dnipremium']} dni</b> premium.</br>


END;
        ?>
        <canvas id="game" width="400" height="400"></canvas>
        <script src="js/game.js"></script>

    </body>
</html>