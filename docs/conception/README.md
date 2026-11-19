# Dossier de conception fonctionnelle — Book Shelf

> Version 0.1 du 19/11/2026 · Auteur : Alex · Statut : brouillon

Ce dossier décrit **ce que** l'application doit faire et **sur quelles données**, avant de décider **comment** la construire. Il se lit dans l'ordre ci-dessous. Chaque document reprend les identifiants des précédents (EX, RG, ENF) : on suit une exigence jusqu'à la table qui la porte.

## Sommaire

| # | Document | Question à laquelle il répond | Compétence |
| --- | --- | --- | --- |
| 1 | [exigences.md](exigences.md) | Que doit faire l'application, avec quelles règles et quelle qualité ? | CP5 |
| 2 | [cas-utilisation.md](cas-utilisation.md) | Qui l'utilise, pour quels buts, avec quels scénarios ? | CP5 |
| 3 | [activites.md](activites.md) | Comment se déroule le cas le plus riche ? | CP5 |
| 4 | [accessibilite-eco-conception.md](accessibilite-eco-conception.md) | Quelles décisions d'accessibilité et de sobriété ? | CP5, CP6 |
| 5 | [mcd.md](mcd.md) | Quelles données, et quelles règles les relient ? | CP7 |
| 6 | [mld.md](mld.md) et [db/](../../db) | Quelles tables, quelles contraintes, quel script ? | CP7 |
| — | [diagrammes/](diagrammes) | Les sources et les images des diagrammes | — |

Chaque document donne en tête sa version, son statut et ses sources. L'architecture technique n'est pas dans ce dossier.

## Cohérence vérifiée le 19/11/2026

- [x] Chaque exigence « Must » a un cas d'utilisation, un écran et une table, ou une raison écrite : voir la [matrice](exigences.md#4-matrice-de-traçabilité).
- [x] Chaque règle de gestion est portée par une cardinalité, une contrainte du schéma, ou notée « hors schéma » : les 36 règles sont dans [mld.md, § 3](mld.md#3-modèle-physique).
- [x] Les noms sont les mêmes partout : compte, livre, impressions, contact, groupe, invitation. Le modèle les nomme en anglais, comme le code : `users`, `books`, `contact_requests`, `groups`, `group_invitations`.
- [x] `db/schema.sql` et `db/jeu-essai.sql` s'exécutent sans erreur sur une base vide ; les trois images des diagrammes correspondent à leurs sources.

## Historique

| Version | Date | Changements |
| --- | --- | --- |
| 0.1 | 19/11/2026 | Assemblage du dossier : six documents, du besoin aux données, et leur vérification de cohérence |
