# Plan de versions — Book Shelf

> Version 0.1 du 21/10/2026 · Plan à date fixe : une version par étape, étiquette Git `e1`, `e2`… au rendu.

| Version | Étape | Fin prévue | Contenu |
|---|---|---|---|
| 0.1 | E1 | 13/11/2026 | Cadrage (note de cadrage, DoD, backlog estimé, plan de versions), environnement Docker Compose, squelette Python (Ruff, mypy, pytest) |
| 0.2 | E2 | 15/01/2027 | Dossier de conception : maquettes, modèle de données, diagrammes UML |
| 0.3 | E3 | 19/02/2027 | Couche métier testée : livre et statut, impressions, statistiques (règles de US-03 à US-08) |
| 0.4 | E4 | 19/03/2027 | Couche métier refactorée, patterns justifiés ; règles des groupes (US-12, US-13) |
| 0.5 | E5 | 16/04/2027 | API REST en couches, documentée par OpenAPI (US-01 à US-10) |
| 0.6 | E6 | 21/05/2027 | Persistance PostgreSQL, migrations ; Redis (sessions, limite des tentatives de connexion) |
| 0.7 | E7 | 18/06/2027 | Interface Lit : parcours complet du lecteur (US-01 à US-10), groupes (US-12, US-13) |
| 0.8 | E8 | 16/07/2027 | Authentification, rôles, administration (US-11), audit de sécurité |
| 0.9 | E9 | 20/08/2027 | Plan de tests, tests d'intégration et de bout en bout, jeu d'essai |
| 1.0 | E10 | 24/09/2027 | Mise en production continue ; Could si le temps le permet (US-14 à US-16) |
| — | E11 | — | Pas de version : dossier de projet et préparation des épreuves |

**Lecture** :

- Must (US-01 à US-09) = **certainement** : placées tôt, règles métier en 0.3, API en 0.5, interface en 0.7.
- Should (US-10 à US-13) = **probablement** : livrées avec les Must quand la couche le permet.
- Could (US-14 à US-16) = **peut-être** : première marge si le temps manque.
- E1 à E4 ne terminent aucune story (le plan suit les couches) : le suivi se fait par le reste à faire en heures, puis par le burnup à partir de E5.
