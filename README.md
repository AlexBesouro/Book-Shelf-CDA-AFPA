# Book Shelf

Application web pour garder la trace de ses lectures au même endroit : livres avec leur statut (à lire, en cours, lu), impressions personnelles, statistiques de lecture et groupes de lecture.

Projet réalisé dans le cadre de la formation Concepteur Développeur d'Applications (AFPA).

> **État** : version 0.1 en cours (cadrage et squelette Python). Le code de l'application n'existe pas encore.

## Prérequis

- [Python](https://www.python.org/) 3.14 ou plus
- [Poetry](https://python-poetry.org/) 2 (par exemple : `pipx install poetry`)
- [Git](https://git-scm.com/)
- [Docker Desktop](https://www.docker.com/products/docker-desktop/) (avec WSL 2 sous Windows), pour PostgreSQL et Redis

## Installation

```bash
git clone https://github.com/AlexBesouro/Book-Shelf-CDA-AFPA-.git
cd Book-Shelf-CDA-AFPA-
poetry install
poetry run pre-commit install
```

`poetry install` crée l'environnement virtuel et installe les dépendances ; `pre-commit install` active les contrôles automatiques à chaque `git commit`.

## Services (Docker)

PostgreSQL et Redis tournent dans Docker (`compose.yaml`) ; l'API tourne sur la machine avec Poetry.

1. Créer son fichier de configuration à partir du modèle, puis y mettre ses propres valeurs (au minimum un mot de passe) :

   ```bash
   cp .env.example .env
   ```

   `.env` est ignoré par Git : il ne doit jamais être commité.

2. Démarrer les services, puis vérifier qu'ils sont `healthy` :

   ```bash
   docker compose up -d
   docker compose ps
   ```

| Commande | Rôle |
|---|---|
| `docker compose config` | Afficher la configuration avec les valeurs de `.env` (contient le mot de passe : ne pas la partager) |
| `docker compose up -d` | Démarrer les services en arrière-plan |
| `docker compose ps` | Voir l'état des services |
| `docker compose logs db` | Voir les journaux d'un service |
| `docker compose down` | Arrêter les services (les données sont conservées) |
| `docker compose down -v` | Arrêter et **supprimer les données** (volumes) |

Les variables de `.env` ne sont lues par PostgreSQL qu'au premier démarrage : pour changer l'utilisateur ou le mot de passe ensuite, repartir de zéro avec `docker compose down -v`.

**Connexion à la base (DBeaver ou autre client)** : hôte `localhost`, port `POSTGRES_PORT` (5432 par défaut), base, utilisateur et mot de passe de votre `.env`. Si un PostgreSQL est déjà installé sur la machine, choisir un autre port (par exemple 5433).

## Commandes utiles

| Commande | Rôle |
|---|---|
| `poetry run pytest --cov` | Lancer les tests avec la couverture (objectif ≥ 70 %) |
| `poetry run ruff check .` | Analyser le code (lint) |
| `poetry run ruff format .` | Formater le code |
| `poetry run mypy src` | Vérifier les types |
| `poetry run pre-commit run --all-files` | Lancer tous les contrôles du commit sur tout le dépôt |
| `poetry add <paquet>` | Ajouter une dépendance (`--group dev` pour un outil de développement) |

## Éditeur

Les réglages communs sont versionnés : `.editorconfig` (encodage, fins de ligne, indentation, pour tous les éditeurs) et `.vscode/` pour VS Code. À l'ouverture du projet, VS Code propose d'installer les extensions recommandées (Python, Ruff, Mypy Type Checker, EditorConfig) : acceptez. Le code est alors formaté et corrigé par Ruff à chaque enregistrement.

Les réglages personnels (thème, police, raccourcis) restent dans vos paramètres utilisateur.

## Documentation

- [Note de cadrage](docs/note-de-cadrage.md)
- [Backlog](docs/backlog.md) (le suivi se fait dans Notion)
- [Plan de versions](docs/plan-de-versions.md)
- [Definition of Done](docs/definition-of-done.md)
- [Journal de bord](docs/journal-de-bord.md)

## Contribuer

Branches, pull requests et messages de commit : voir [CONTRIBUTING.md](CONTRIBUTING.md).
