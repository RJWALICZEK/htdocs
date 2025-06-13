<?php
    session_start();

    if(isset($_POST['email']))
    {
        $wszystko_ok=true;

        //sprawdz czy jest nick dobry
        $nick=$_POST['nick'];
        if(((strlen($nick)<3) || (strlen($nick)>20)) || !ctype_alnum($nick))
        {
            $wszystko_ok=false;
            $_SESSION['e_nick'] = 'Nick musi posiadac od 3 do 20 znakow i skladac sie z wylacznie liter i cyfr (bez polskich znakow!) ';
        }

        $email=$_POST['email'];
        $emailb=filter_var($email, FILTER_SANITIZE_EMAIL);

       if((filter_var($emailb, FILTER_VALIDATE_EMAIL) == false) || ($emailb != $email))
       {
            $wszystko_ok=false;
            $_SESSION['e_email']='wprowadzony email jest niepoprawny!';
       }

       $haslo1 = $_POST['pass1'];
       $haslo2 = $_POST['pass2'];

       if((strlen($haslo1)<8) || (strlen($haslo1)>20))
       {
            $wszystko_ok=false;
            $_SESSION['e_pass'] = 'Haslo musi zawierac od 8 do 20 znakow!';
       }
       elseif(($haslo1 != $haslo2))
       {
            $wszystko_ok=false;
            $_SESSION['e_pass'] = 'Hasla nie moga roznic sie od siebie!';
       }

        if($wszystko_ok==true)
        {
            //wszystkie testy zaliczone, dodajemy gracza do bazy
            echo "Udana walidacja!";
        }
    }

?>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="utf-8"/>
    <title>Osadnicy rejestracja</title>
    <script src="https://www.google.com/recaptcha/enterprise.js?6LdYCBorAAAAAC1vvEdARaTXzlRkNBpTeHGiHSJi">
       
                function onSubmit(token) {
                    document.getElementById("demo-form").submit();
                } // Use `requestSubmit()` for extra features like browser input validation.

    </script>
    <link rel="stylesheet" href="css/style.css"/>
    </head>
        <body>
            <h1>Rejestracja</h1>
            </br></br>
            <form method="POST">
                    Nickname:
                        <input type="text" name="nick"/></br>
                    <?php
                        if(isset($_SESSION['e_nick']))
                        {
                           echo '<div class="error">'.$_SESSION['e_nick'].'</div>';
                        }
                        unset($_SESSION['e_nick']);
                    ?>
                    E-mail:
                        <input type="text" name="email"/></br>
                        <?php
                            if(isset($_SESSION['e_email']))
                            {
                                echo '<div class="error">'.$_SESSION['e_email'].'</div>';
                            }
                            unset($_SESSION['e_email']);
                        ?>
                    Twoje haslo:
                        <input type="password" name="pass1"/></br>
                    Powtorz haslo:
                        <input type="password" name="pass2"/>
                        <?php
                            if(isset($_SESSION['e_pass']))
                            {
                                echo '<div class="error">'.$_SESSION['e_pass'].'</div>';
                            }
                            unset($_SESSION['e_pass']);
                        ?>
                        </br></br>
                    <label>
                        <input type="checkbox" name="regulamin"/> Akceptuje regulamin </br>
                    </label>
                    <button class="g-recaptcha"
                        data-sitekey="6LdYCBorAAAAAC1vvEdARaTXzlRkNBpTeHGiHSJi"
                        data-callback='onSubmit'
                        data-action='submit'>Submit</button></br></br>
                    <input type="submit" name="Rejestracja"/>
                </form>
        </body>
</html>
