## Ce que fait cette pull request

User story : US-NN — [titre] · Carte Notion : [lien]
<!-- Pour une anomalie suivie sur GitHub : Closes #N -->

-
-

**Comment vérifier** : `pytest tests/…`, puis le scénario des critères d'acceptation sur http://localhost:8000/docs

## Vérifications (DoD)

- [ ] Critères d'acceptation vérifiés
- [ ] `ruff check .` et `ruff format --check .` sans erreur
- [ ] `mypy src` sans erreur
- [ ] `pytest` passe, couverture ≥ 70 %
- [ ] Test d'autorisation pour chaque route nouvelle (rôle, propriété de la donnée)
- [ ] Entrées validées côté serveur, aucune erreur technique affichée
- [ ] Aucun secret ni donnée personnelle réelle (code, tests, captures)
- [ ] Parcours au clavier et affichage correct dès 360 px (si interface)
- [ ] Documentation à jour (README, `docs/`)

## Relecture

- [ ] Relue à froid (le lendemain) dans *Files changed*, fichier par fichier
- [ ] Un seul sujet, moins de 400 lignes modifiées environ
- [ ] Aucun fichier parasite (`.env`, `.venv/`, caches, fichiers de l'éditeur)
- [ ] Pas de `print` ni de code commenté oublié
- [ ] Titre au format Conventional Commits : il deviendra le commit sur `main`
