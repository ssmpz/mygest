#!/bin/bash

read -p "Veuillez indiquer l'id de l'élement a modifer : " id

read -p "Nouveau Nom : " nom
read -p "Nouvelle Adresse MAC : " adMac
read -p "Nouvelle Adresse IP : " adIP
read -p "Nouveau Masque : " CIDR
read -p "Type de la Machine (machine = 1, switch = 2, server = 3) : " idT


requete="UPDATE Equipement SET nom ='$nom', adMac = '$adMac', adIp = '$adIP', CIDR = '$CIDR', idT = $idT WHERE id = '$id';"
sudo mysql mygest -e "$requete"

echo "Les données ont été modifiées dans la base de données"

