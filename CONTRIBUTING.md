# Règles de contribution — Book Shelf

## Suivi du travail

Le backlog et le tableau Kanban vivent dans **Notion** (source unique) ; `docs/backlog.md` en est l'export lisible, mis à jour à chaque fin d'étape. Les issues GitHub servent uniquement aux **anomalies** (modèle « Anomalie »). Pourquoi : un seul outil de pilotage, et un lien direct entre un bogue et la pull request qui le corrige.

## Branches

GitHub Flow : `main` toujours stable (tests au vert, application qui démarre) ; une branche par user story, créée depuis `main` à jour, supprimée après la fusion.

Nommage, en minuscules, sans accents ni espaces :

| Contenu | Format | Exemple |
|---|---|---|
| User story | `us-NN-sujet` | `us-03-ajouter-livre` |
| Correctif | `fix-sujet` | `fix-note-hors-limite` |
| Documentation | `docs-sujet` | `docs-plan-de-versions` |
| Outillage | `chore-sujet` | `chore-outillage-github` |

Pourquoi : un seul développeur, une version livrée par étape, pas de versions maintenues en parallèle ; Git Flow ajouterait des fusions sans bénéfice.

## Pull requests

Toute modification de `main` passe par une pull request (ruleset « Protéger main ») :

- le modèle de pull request est rempli : lien vers la carte Notion (ou `Closes #N` pour une anomalie) et checklist de la DoD (`docs/definition-of-done.md`) ;
- fusion par **Squash and merge** : un commit par story sur `main`, titré comme la pull request.

## Messages de commit

Conventional Commits 1.0.0 : `type(portée): description`, type en anglais, description en français à l'infinitif, sans point final.

| Type | Usage | Exemple |
|---|---|---|
| `feat` | Nouvelle fonctionnalité | `feat(bibliotheque): ajouter un livre avec son statut` |
| `fix` | Correction d'un bogue | `fix(impressions): refuser une note supérieure à 10` |
| `docs` | Documentation seule | `docs: compléter le plan de versions` |
| `test` | Tests seuls | `test(statistiques): couvrir une bibliothèque sans livre lu` |
| `refactor` | Restructuration sans changement de comportement | `refactor(livre): extraire la validation du statut` |
| `chore` | Entretien, outillage | `chore: ajouter les modèles de pull request` |
| `ci` | Intégration continue | `ci: lancer pytest à chaque pull request` |

Pourquoi : un historique filtrable par type, et le titre de la pull request devient le message du commit sur `main`.

## Sécurité

Dépôt public : aucun secret (tout passe par `.env`, ignoré par Git ; `.env.example` documente les variables) et aucune donnée personnelle réelle, ni dans le code, ni dans les tests, ni dans les issues.
