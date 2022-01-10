# flutter_riverpod_todo_app

Utilisation d'une archi riverpod pour une app todolist avec flutter 

Je me suis inspiré de ce site internet :
https://bettercoding.dev/flutter/simple-app-architecture-riverpod/
pour réaliser cette application, ce site web propose une archi
Riverpod simple et facile à comprendre si on a déjà lu la doc sur 
Riverpod : https://riverpod.dev/.

Le but de cette application est que je me familiarise avec Riverpod
et que je vois un exemple d'architecture avec Flutter.

# Explication de l'architecture

Premièrement, notre application aura un state. Un state peut être
un ensemble de données qui définit ce qu'il faut montrer à
l'utilisateur.

L' interface utilisateur (UI) est mise à jour en fonction du state.
Chaque fois que le state change, notre interface utilisateur est
recréée avec les nouvelles données.

Lorsqu'il y a des interactions de l'utilisateur avec l'interface
utilisateur, telles que des clics sur des boutons, ces événements
sont transmis au contrôleur. Le contrôleur est alors chargé
d'effectuer les actions en conséquence et de mettre à jour le state.

Le repository est responsable de la gestion des données.
Dans notre application, il contiendra une liste d'entrées,
fournira un moyen de les récupérer et autorisera l'ajout
et la suppression de ces entrées.