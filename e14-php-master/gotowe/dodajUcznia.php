<?php
skrypt();

function skrypt(){
	if(isset($_POST["imie"]) && $_POST["imie"] != "" && isset($_POST["nazwisko"]) && $_POST["nazwisko"] != "" && isset($_POST["wiek"]) && $_POST["wiek"] != ""){

		$conn = mysqli_connect("localhost", "root", "", "dziennik");
		if(!$conn){
			echo "nie udalo sie polaczyc z baza";
			return;
		}
		$imie = $_POST["imie"];
		$nazwisko = $_POST["nazwisko"];
		$wiek = $_POST["wiek"];

		$sql = "INSERT INTO uczniowie VALUES('$imie', '$nazwisko', $wiek)";
		$res = mysqli_query($conn, $sql);

		if($res){
			echo "dodano ucznia";
		}else{
			echo "nie udalo sie dodac ucznia";
		}

		mysqli_close($conn);
	}else{
		echo "wpisz imie ucznia";
	}
}

?>
