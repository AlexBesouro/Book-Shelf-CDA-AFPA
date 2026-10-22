# Note de cadrage — Book Shelf

> Version 0.1 du 20/10/2026 · Auteur : Alex · Statut : proposée au formateur

## 1. Contexte

Beaucoup de lecteurs gardent la trace de leurs lectures de façon dispersée : un carnet, des notes sur le téléphone, des photos de couvertures, des listes « à lire » envoyées par message. Rien n'est centralisé, et ces traces se perdent avec le temps.

Il en découle des problèmes concrets :

- les titres trouvés ou recommandés par des proches sont oubliés ;
- les impressions personnelles (note, ressenti, citations) sont introuvables quelques mois plus tard ;
- il est impossible d'avoir une vue d'ensemble de ses lectures (combien de livres lus dans l'année, quels auteurs, quels genres) ;


## 2. Objectifs

| Objectif | Indicateur de réussite |
|---|---|
| Centraliser ses lectures au même endroit | Un livre est ajouté avec son statut (à lire, en cours, lu) en moins de 1 minute |
| Retrouver ses impressions de lecture | La note, le ressenti et les citations d'un livre s'affichent en 2 clics depuis la bibliothèque |
| Avoir une vue d'ensemble de ses lectures | Le nombre de livres lus par année, par auteur et par genre est consultable sur une seule page |

## 3. Utilisateurs, rôles et parties prenantes

| Rôle | Ce qu'il fait |
|---|---|
| Visiteur | Découvre le service, crée un compte |
| Lecteur | Gère sa bibliothèque : ajoute des livres, change leur statut, écrit ses impressions, consulte ses statistiques ; crée un groupe de lecture, rejoint un groupe |
| Administrateur | Supprime le compte d'un autre utilisateur, ou le restaure |

| Partie prenante | Attente principale | Position | Comment l'associer |
|---|---|---|---|
| Formateur et moi meme (commanditaire) | Un projet qui couvre les compétences CDA, livré à temps | Pouvoir fort, intérêt fort | Valide la note de cadrage, arbitre les changements |
| Lecteurs testeurs (Proches) | Retrouver facilement leurs lectures | Pouvoir faible, intérêt fort | Tests sur les maquettes puis sur l'application |
| CNIL (réglementation) | Le respect du RGPD | Pouvoir fort, intérêt faible | Son guide RGPD du développeur est appliqué |

## 4. Périmètre

**Inclus (MVP, version 1.0)** : création de compte et connexion ; ajout d'un livre (titre, auteur, genre, langue) avec son statut (à lire, en cours, lu) ; impressions personnelles par livre (note sur 10, ressenti, citations) ; bibliothèque avec recherche et filtres ; statistiques de lecture (par année, auteur, genre) ; groupes de lecture : un lecteur crée un groupe (nom, description), visible et ouvert aux autres lecteurs ; le groupe choisit un livre et un objectif de rythme (par exemple 3 chapitres par semaine), chaque membre indique sa progression et voit celle des autres ; suppression d'un compte par l'administrateur, restaurable pendant 30 jours.

**Exclus** :

- autres fonctions sociales (suivre d'autres lecteurs, commenter, messagerie dans les groupes) : elles doubleraient le périmètre et demandent de la modération ;
- application mobile native : un site adapté au téléphone suffit ;
- recommandations automatiques de livres : hors de portée d'un MVP ;
- achat ou liens vers des boutiques : hors du besoin, qui est de garder une trace de ses lectures.

## 5. Exigences non fonctionnelles

| Famille | Exigence vérifiable |
|---|---|
| Sécurité (ANSSI) | Mots de passe hachés (Argon2) ; entrées validées côté serveur ; chaque route vérifie le rôle et que la donnée appartient au lecteur connecté |
| RGPD | Seuls un pseudonyme et un courriel sont collectés ; impressions privées, progression visible des seuls membres du groupe ; compte inactif depuis 2 ans supprimé ; compte supprimé par l'administrateur effacé définitivement après 30 jours ; suppression de son compte possible à tout moment |
| Accessibilité (RGAA) | RGAA 4.1.2, niveau AA visé ; ajout d'un livre entièrement au clavier |
| Éco-conception (RGESN) | Une page pèse moins de 500 Ko ; bibliothèque paginée par 20 livres |
| Compatibilité | Dernières versions de Chrome, Firefox, Safari et Edge ; écrans à partir de 360 px |

## 6. Contraintes, hypothèses et dépendances

**Contraintes** :

- stack de la formation : Lit, Python et FastAPI (API), PostgreSQL, Redis,Docker, GitHub  ;
- un seul développeur, en alternance, au rythme d'une étape par mois (11 étapes, jusqu'au 30/09/2027) ;
- données personnelles : conformité au RGPD.

**Hypothèses** :

| Hypothèse | Vérification |
|---|---|
| Proches acceptent de tester l'application | Leur demander un accord et une date de test (étape 1) |
| Un hébergement gratuit suffit pour l'API et la base | Déployer une première version minimale (étape 3) |
| Le nombre de chapitres suffit pour mesurer la progression dans un groupe | Le tester sur 3 livres réels lors des maquettes (étape 2) |

**Dépendances** : disponibilité du formateur pour valider et arbitrer ; disponibilité des testeurs ; service d'hébergement choisi.

## 7. Livrables

| Livrable | Échéance |
|---|---|
| Note de cadrage, DoD (définition de « terminé »), backlog, plan de versions | Semaine 1 |
| Dépôt GitHub du projet | Semaine 1, alimenté ensuite à chaque étape |
| Dossier de conception : maquettes, modèle de données, diagrammes UML | Étape 2 |
| Première version en ligne et documentation de déploiement | Étape 3 |
| Plan de tests et jeu d'essai | Étape 9 |
| Application en ligne, version 1.0 | 30/09/2027 |
| Dossier de projet pour le jury | 30/09/2027 |

## 8. Risques

| Risque | Probabilité | Impact | Parade |
|---|---|---|---|
| Envie d'ajouter des fonctions hors MVP (social, recommandations) → la v1.0 n'est pas finie à temps | Forte | Fort | Éviter : exclusions écrites ici ; toute nouvelle idée va au backlog, après la v1.0 ; MVP figé à l'étape 2 |
| Charge de travail forte en entreprise (alternance) → une étape prend du retard | Moyenne | Moyen | Accepter et surveiller : journal de bord chaque semaine ; prévenir le formateur dès une semaine de retard |
| Technologies nouvelles pour moi → leur apprentissage prend plus de temps que prévu | Moyenne | Moyen | Réduire : petit prototype de chaque technologie avant de l'utiliser dans le projet |


## 9. Planning

Une version par étape : voir `docs/plan-de-versions.md` (fiche 5).

## 10. Démarche

**Choix** : démarche hybride. Le cadre (11 étapes datées, livrables imposés) est fixé par la formation ; à l'intérieur, démarche inspirée de Scrum, adaptée à un projet mené seul, avec un flux géré en Kanban.

**Justification** :

- Besoin : le cœur est connu (bibliothèque, impressions), les groupes de lecture se précisent en concevant → itérations courtes ;
- Contrat : date fixe (30/09/2027), périmètre ajustable → MVP priorisé en MoSCoW ;
- Contraintes : livrables imposés à chaque étape → une étape = une itération ;
- Regard extérieur : le formateur, une fois par mois → démonstration à chaque bilan ;
- Apprentissage : technologies nouvelles → retours fréquents pour corriger tôt.

**Rythme** :

| Scrum | Book Shelf |
|---|---|
| Sprint | Une étape (E1 à E11) |
| Sprint Planning | Lancement de l'étape, vendredi de la semaine de formation |
| Daily Scrum | 5 min en début de séance, une ligne dans le journal de bord |
| Sprint Review | Bilan du lundi : démonstration de la version étiquetée au formateur |
| Sprint Retrospective | Rubrique « Rétrospective » du rapport d'étape |
| Increment | Version étiquetée (`e1`, `e2`…) : seulement ce qui respecte la DoD (définition de « terminé ») |

**Flux** : Backlog → À faire → En cours (1) → En relecture (1) → Terminé. Un élément entre « En cours » s'il est en haut du backlog ; il passe « En relecture » quand sa pull request est ouverte ; il entre « Terminé » quand la DoD (définition de « terminé ») est respectée (`docs/definition-of-done.md`).

**Outils** :

- Notion : backlog unique et tableau Kanban avec limites → rendre le flux visible ;
- Git et GitHub : une branche par user story, pull request relue avant fusion → appliquer la DoD (définition de « terminé ») ;
- `docs/` dans le dépôt : documents versionnés avec le code → matière du dossier de projet ;
