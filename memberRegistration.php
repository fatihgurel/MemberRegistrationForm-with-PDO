<?php
if ($_POST) {
    $name       = $_POST["name"];
    $ogrencino  = $_POST["ogrencino"];
    $fakulte    = $_POST["fakulte"];
    $bolum      = $_POST["bolum"];
    $email      = $_POST["email"];
    $telefon    = $_POST["telefon"];
    $sinif      = $_POST["sinif"];
    $komite     = $_POST["komite"];



    try {
        $db = new PDO("mysql:host=localhost; dbname=memberRegistration;charset=utf8", "root");
    } catch (PDOException $e) {
        echo $e->getMessage();
    }
    $rows = $db->query("SELECT * FROM members", PDO::FETCH_ASSOC);

    $data = array(
        "name"       => $name,
        "ogrencino"  => $ogrencino,
        "fakulte"    => $fakulte,
        "bolum"      => $bolum,
        "email"      => $email,
        "telefon"    => $telefon,
        "sinif"      => $sinif,
        "komite"     => $komite
    );
    $insert = $db->prepare("INSERT INTO members SET
                name=:name,
                ogrencino=:ogrencino,
                fakulte=:fakulte,
                bolum=:bolum,
                email=:email,
                telefon=:telefon,
                sinif=:sinif,
                komite=:komite
            ");

            
    $adres="refresh:0.2;url=member.html";        
    if(empty($name) || empty($ogrencino) || empty($fakulte) || empty($bolum) || empty($email) || empty($telefon) || empty($sinif) || empty($komite)){
        header($adres);
        $message = "allEmpty";       
        echo $message;
    }else{
        $index = 0;
        foreach ($rows as $row) {
            if ($row["ogrencino"] == $ogrencino) {
                $index=1;
            }
            if ($row["email"] == $email) {
                $index=2;
            }
            if ($row["telefon"] == $telefon) {
                $index=3;
            }       
        }
    
        if($index==0){
            $result = $insert->execute($data);            
            if ($result) {
            header($adres);
            $message = "success";
            echo $message; 
            }else {
                header($adres);
                $message = "error";
                echo $message;      
            }           
        }else if($index==1){
            header($adres);
            $message = "duplicateSchoolNumber";
            echo $message; 
        }else if($index==2){
            header($adres);
            $message = "duplicateEmail";
            echo $message; 
        }else if($index==3){
            header($adres);
            $message = "duplicatePhoneNumber";
            echo $message; 
        }
        $index=0;
    } 
}
