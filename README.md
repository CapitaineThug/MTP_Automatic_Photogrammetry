# MTP-Automatic-Photogrammetry
Ce programme permet d'automatiser l'utilisation du protocole MTP avec une caméra en USB pour copier automatiquement les images de la caméra et de lancer un pipeline de photogramétrie avec Agisoft Metashape. 

# Prérequis
Pour utiliser ce programme, il faut avoir les différences dépendances:
- FreeFilySync, avec le fichier "ffs_batch" associé comme programme par défaut [download](https://freefilesync.org/download.php)
- Agisoft Metashape, ajouté au PATH

# Comment démarrer un scan
1. Connecter la caméra pas USB et activer le mode MTP. La caméra devrait apparaitre dans le file explorer
2. Démarrer le script "Script.ps1"
3. Renseigner comme path pour les images le path racine dans lequel se trouvent les images de la caméra (utiliser le format "mtp:\")
4. Renseigner comme path de projet le répertoire racine dans lequel un dossier avec le nom de projet va se créer
5. Choisir un nom de projet (sera utilisé pour tous les nommages des fichiers)
6. Choisir un délai (pas trop court, sinon le programme n'aura pas le temps de sychroniser, recommandé: 5 sec)
7. Faire une première photographie avec la caméra et ensuite cliquer sur "Synchroniser automatiquement"

Les images devraient automatiquement se copier depuis la caméra jusque dans le répertoire de projet sour IMG. Après le temps renseigné d'innactivité, le projet se lance tout seul (également possible de le lancer manuellement depuis le bouton prévu à cet effet). Le résultat sera un projet Metashape ouvert avec comme images celles du chemin d'accès renseigné pour les images.