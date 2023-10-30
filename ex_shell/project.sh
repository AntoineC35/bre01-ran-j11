#!/bin/bash
cd ~/sites

# Vérifier les fichiers et répertoires déjà créés
echo -e "\e[1;32m Voici les types de fichiers déjà créés :\e[0m"
for item in *
do
    if [ -d "$item" ]; then
        echo -e "\e[1;36m Répertoire : $item\e[0m"
    elif [ -f "$item" ]; then
        echo -e "\e[1;33m Fichier : $item\e[0m"
    fi
done

# test d'ajout de parametre au script
if [ $# -ge 2 ]; then
    type_fichier="$1"
    name_project="$2"
else
# Afficher le tableau des types dispo 
    echo -e "\e[1;32m Quel type de projet souhaitez-vous créer ?\e[0m"
    fichiers="inte js php ran react"
    types=($fichiers)
    for type in "${types[@]}"
    do
        echo -n -e "\e[1;44m $type  \e[0m"
    done

    read type_fichier

    cd "$type_fichier"

# Creation du dossier du projet dans le repertoir du type & création des templates de bases

    echo -e "\e[1;32m Quel est le nom du projet ?\e[0m"
    read name_project
fi 
  cd "$type_fichier"
mkdir "$name_project"
cd "$name_project"
echo -e "\e[1;33m Création des sous-dossiers...\e[0m"

# Fonction pour afficher une barre de chargement simulée
simulate_loading() {
    local duration="$1"  # Durée de la simulation en secondes
    local step=0.01       # Intervalle de progression
    local progress=0

    while ((progress < 100)); do
        echo -ne "\r["
        for ((i = 0; i < progress; i++)); do
            echo -n "#"
        done
        for ((i = progress; i < 100; i++)); do
            echo -n " "
        done
        echo -n "] $progress%"
        sleep "$step"
        progress=$((progress + 1))
    done
    echo
}
# Simuler une barre de chargement
simulate_loading 5  # Durée de 5 secondes

if [ "$type_fichier" == "inte" ] || [ "$type_fichier" == "php" ]
then
 mkdir -p assets/css assets/js assets/img
elif [ "$type_fichier" == "js" ]
then
    mkdir -p assets/css assets/js assets/js/modules assets/img
elif [ "$type_fichier" == "react" ] || [ "$type_fichier" == "ran" ]
then echo -e "\e[1;35m Aucun sous dossier nécessaire \e[0m"
else
    echo -e "\e[1;31m Type de fichier incorrect \e[0m"
fi

cd ~
touch index.html
echo "<!doctype html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>Document</title>
    </head>
    <body>
        
    </body>
</html>" > index.html

touch index.php
echo "<?php" > index.php

touch style.css
echo "html {
    
}

body {
    
}" > style.css
touch main.js
echo "window.addEventListener("DOMContentLoaded", function(){
    
});" > style.css

# Creation des sous dossiers en fonction du type de projet

cd ~/sites/"$type_fichier"/"$name_project"
if [ "$type_fichier" == "inte" ]
then
    cp ~/index.html ~/sites/"$type_fichier"/"$name_project"
    cp ~/style.css ~/sites/"$type_fichier"/"$name_project"/assets/css
elif [ "$type_fichier" == "js" ]
then
    cp ~/index.html ~/sites/"$type_fichier"/"$name_project"
    cp ~/style.css ~/sites/"$type_fichier"/"$name_project"/assets/css
    cp ~/main.js ~/sites/"$type_fichier"/"$name_project"/assets/js
elif [ "$type_fichier" == "php" ]
then
    cp ~/index.php ~/sites/"$type_fichier"/"$name_project"
elif [ "$type_fichier" == "react" ] || [ "$type_fichier" == "ran" ]
then echo -e "\e[1;35m Aucune configuration nécessaire \e[0m"
else
echo -e "\e[1;31m Rien ne fonctionne !\e[0m"
fi

echo -e "\e[1;32m Félicitation ! Votre projet est prêt !\e[0m"