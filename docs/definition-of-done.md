# 📋 Definition of Done (DoD)

> Définition de « terminé » · Book Shelf · s'applique à chaque user story.

## 1. Développement et qualité du code

- [ ] Le code respecte les conventions du projet (nommage, structure des dossiers).
- [ ] `ruff check` et `ruff format --check` passent sans erreur (API Python).
- [ ] `mypy` passe sans erreur.
- [ ] Aucun secret dans le code (mots de passe, clés) : tout passe par `.env`.
- [ ] Code Review faite : pull request relue à froid (le lendemain) avec cette checklist.

## 2. Tests

- [ ] Tests unitaires écrits et `pytest` passe (couverture ≥ 70 %).
- [ ] Chaque route nouvelle a un test d'autorisation (rôle, propriété de la donnée).
- [ ] Test manuel selon les Acceptance Criteria de la user story.
- [ ] Aucun bug connu de priorité haute ou critique.

## 3. Sécurité, RGPD et accessibilité

- [ ] Entrées validées côté serveur (schémas Pydantic), aucune erreur technique affichée.
- [ ] Aucune donnée personnelle collectée hors pseudonyme et courriel.
- [ ] Parcours utilisable au clavier et affichage correct à partir de 360 px.

## 4. Documentation

- [ ] README ou `docs/` mis à jour si l'API, la base ou l'architecture changent.
- [ ] Commentaires ajoutés là où le code n'est pas évident.

## 5. Déploiement et infrastructure

- [ ] L'application démarre avec `docker compose up` et la base se crée par migration.
- [ ] Contrôles automatiques passés en CI (GitHub Actions, à partir de l'étape 10).
- [ ] Pull request fusionnée dans `main`, carte Notion dans « Terminé ».
- [ ] Résultat validé par le formateur lors du bilan d'étape (Sprint Review).
