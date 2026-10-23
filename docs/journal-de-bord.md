# Journal de bord — Book Shelf

> Une entrée par séance, écrite en fin de séance : fait, décisions et raisons, difficultés, temps passé.

| Date | Durée | Fait | Décision ou difficulté (et raison) |
|---|---|---|---|
| 19/10/2026 | 4 h | Classe virtuelle d'ouverture ; choix du sujet Book Shelf | Sujet retenu : un projet personnel simple, pour me concentrer sur l'apprentissage de la stack |
| 20/10/2026 | 2 h | Note de cadrage v0.1 (contexte, objectifs, rôles, périmètre, exigences, risques) | Fonctions sociales, recommandations et boutiques exclues : elles doubleraient le périmètre. Un seul champ « langue » au lieu d'un lien entre éditions : plus simple pour le MVP |
| 20/10/2026 | 2 h | Section « Démarche » et DoD | Notion au lieu de GitHub Projects pour le backlog et le tableau Kanban : outil que je préfère utiliser. DoD réécrite en checklist adaptée au projet, mypy et pytest conservés |
| 21/10/2026 | 2 h | Backlog : 19 user stories, MoSCoW, Must détaillées, couverture des objectifs | User stories rédigées à partir des objectifs et du périmètre de la note de cadrage, pour que chaque objectif soit couvert |
| 21/10/2026 | 2 h | Estimations (54 points, Must 57 %) et plan de versions | Référence US-03 = 3 points. US-01, US-02, US-08, US-09 à estimer avec le formateur au bilan. Écart à vérifier : v1.0 au 24/09/2027 |
| 22/10/2026 | 1 h | Dépôt GitHub, GitHub CLI, première pull request (brouillons ignorés) | Fusion par *Squash and merge* : un commit par pull request sur `main`. Modèle de pull request : les cases sans objet sont retirées, celles non faites restent décochées avec une note |
| 22/10/2026 | 2 h | Outillage Python : Poetry, Ruff, mypy, pytest, pytest-cov, pre-commit ; README | pre-commit pour que la DoD (Ruff, mypy, aucun secret) soit vérifiée à chaque commit plutôt que de mémoire. pytest hors pre-commit : trop lent à chaque commit, lancé avant la pull request |
| 22/10/2026 | 1 h | Réglages d'éditeur partagés : `.editorconfig`, `.gitattributes`, `.vscode/`, `poetry.toml` | Réglages d'équipe versionnés, réglages personnels hors dépôt. Environnement virtuel dans `.venv/` pour que VS Code le détecte. Difficulté : deux environnements (Poetry et VS Code) et `.venv` verrouillé par les extensions VS Code ; à retenir : fermer VS Code avant de recréer un environnement, puis « Select Interpreter » |
| 22/10/2026 | 2 h | Environnement Docker Compose : PostgreSQL 18, Redis 8, `.env.example` | DBeaver au lieu d'Adminer : un client de bureau, un conteneur de moins. Ports limités à `127.0.0.1`, healthchecks, versions d'images figées. Point d'attention : les variables `POSTGRES_*` ne sont lues qu'au premier démarrage du volume |
| 23/10/2026 | 2 h | Squelette FastAPI (`GET /health`), premier test avec `TestClient`, couverture 100 % | mypy strict dès maintenant : code minimal, donc coût nul. Ruff : règles par défaut + famille `E` (`extend-select`, car `select` remplacerait les règles par défaut). pytest échoue sous 70 % de couverture : la DoD est vérifiée par l'outil. Difficultés : interpréteur VS Code invalide (ancien environnement mémorisé), scripts PowerShell bloqués (politique d'exécution) |
