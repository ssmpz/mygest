#!/bin/bash

is_valid_ip() {
    local ip=$1

    if [[ $ip =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
        IFS='.' read -r -a octets <<< "$ip"
        for octet in "${octets[@]}"; do
            if [ "$octet" -lt 0 ] || [ "$octet" -gt 255 ]; then
                return 1
            fi
        done
        return 0
    else
        return 1
    fi
}

while true; do
    read -p "Adresse IP : " adIP

    if ! is_valid_ip "$adIP"; then
        echo "Adresse IP invalide. Le programme va s'arrêter."
        exit 1  
    else 
        echo "Adresse IP valide."
        break  
    fi
done

read -p "Nom : " nom
read -p "Adresse Mac : " adMac
read -p "Masque (CIDR) : " CIDR
read -p "Type (1:machine, 2:switch, 3:server) : " type

# Correction de l'erreur de syntaxe dans la requête SQL
requete="INSERT INTO Equipement (nom, adMac, adIp, CIDR, idT, color) VALUES ('$nom', '$adMac', '$adIP', '$CIDR', '$type', '');"

sudo mysql mygest -e "$requete"
echo "Les valeurs ont été ajoutées à la base de données."



