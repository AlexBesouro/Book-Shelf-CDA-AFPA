# Accessibilité et éco-conception — Book Shelf

> Version 0.2 du 19/11/2026 · Auteur : Alex · Statut : brouillon
>
> Sources : [exigences v0.5 du 19/11/2026](exigences.md) · [cas d'utilisation v0.3 du 19/11/2026](cas-utilisation.md)
>
> Référentiels : [RGAA 4.1.2](https://accessibilite.numerique.gouv.fr/methode/criteres-et-tests/) (accessibilité, niveau AA visé) · [RGESN 2024](https://ecoresponsable.numerique.gouv.fr/publications/referentiel-general-ecoconception/) (éco-conception)

Les écrans cités ici sont ceux des exigences « Must ».

| Écran | Exigences |
| --- | --- |
| Création de compte | EX-01 |
| Connexion | EX-02 |
| Bibliothèque | EX-04 |
| Ajout d'un livre | EX-03 |
| Fiche d'un livre | EX-05, EX-06, EX-07 |
| Statistiques | EX-08 |
| Mon compte | EX-09 |

## 1. Accessibilité

| ID | Décision | Thématique du RGAA (critères) | Écrans | Exigence |
| --- | --- | --- | --- | --- |
| ACC-01 | Contraste d'au moins 4,5:1 pour le texte, 3:1 pour le grand texte, les composants et le focus | Couleurs ([3.2](https://accessibilite.numerique.gouv.fr/methode/criteres-et-tests/#3.2), [3.3](https://accessibilite.numerique.gouv.fr/methode/criteres-et-tests/#3.3)) | Tous | ENF-05 |
| ACC-02 | Aucune information par la couleur seule : le statut d'un livre et les erreurs sont toujours écrits | Couleurs ([3.1](https://accessibilite.numerique.gouv.fr/methode/criteres-et-tests/#3.1)) | Tous | ENF-05 |
| ACC-03 | Un seul titre de niveau 1 par écran, repris dans l'onglet du navigateur ; aucun niveau de titre sauté | Structuration de l'information ([9.1](https://accessibilite.numerique.gouv.fr/methode/criteres-et-tests/#9.1)) ; Éléments obligatoires ([8.5](https://accessibilite.numerique.gouv.fr/methode/criteres-et-tests/#8.5), [8.6](https://accessibilite.numerique.gouv.fr/methode/criteres-et-tests/#8.6)) | Tous | ENF-05 |
| ACC-04 | Tout se fait au clavier, sans piège, dans l'ordre de lecture, avec un focus toujours visible | Navigation ([12.8](https://accessibilite.numerique.gouv.fr/methode/criteres-et-tests/#12.8), [12.9](https://accessibilite.numerique.gouv.fr/methode/criteres-et-tests/#12.9)) ; Présentation de l'information ([10.7](https://accessibilite.numerique.gouv.fr/methode/criteres-et-tests/#10.7)) ; Scripts ([7.3](https://accessibilite.numerique.gouv.fr/methode/criteres-et-tests/#7.3)) | Tous | ENF-05 |
| ACC-05 | Chaque champ a une étiquette visible au-dessus de lui ; elle indique le format attendu et si le champ est obligatoire | Formulaires ([11.1](https://accessibilite.numerique.gouv.fr/methode/criteres-et-tests/#11.1), [11.2](https://accessibilite.numerique.gouv.fr/methode/criteres-et-tests/#11.2), [11.10](https://accessibilite.numerique.gouv.fr/methode/criteres-et-tests/#11.10)) | Création de compte, Connexion, Ajout d'un livre, Fiche d'un livre, Mon compte | ENF-05 |
| ACC-06 | Un message écrit sous le champ explique l'erreur et sa correction ; il est annoncé aux lecteurs d'écran | Formulaires ([11.10](https://accessibilite.numerique.gouv.fr/methode/criteres-et-tests/#11.10), [11.11](https://accessibilite.numerique.gouv.fr/methode/criteres-et-tests/#11.11)) ; Scripts ([7.5](https://accessibilite.numerique.gouv.fr/methode/criteres-et-tests/#7.5)) | Création de compte, Connexion, Ajout d'un livre, Fiche d'un livre, Mon compte | ENF-04, ENF-05 |
| ACC-07 | Une action réussie est confirmée par un message écrit, annoncé aux lecteurs d'écran, qui reste affiché | Scripts ([7.5](https://accessibilite.numerique.gouv.fr/methode/criteres-et-tests/#7.5)) | Bibliothèque, Fiche d'un livre | ENF-05 |
| ACC-08 | Les statistiques sont des tableaux avec titre et en-têtes, sans graphique en version 1.0 | Tableaux ([5.4](https://accessibilite.numerique.gouv.fr/methode/criteres-et-tests/#5.4), [5.6](https://accessibilite.numerique.gouv.fr/methode/criteres-et-tests/#5.6), [5.7](https://accessibilite.numerique.gouv.fr/methode/criteres-et-tests/#5.7)) | Statistiques | ENF-05, ENF-03 |

**Échantillon de vérification** : quand les écrans seront développés, ces décisions seront vérifiées sur cinq d'entre eux, avec un outil automatique, le clavier seul, le zoom à 200 % et un lecteur d'écran.

| Écran | Raison du choix |
| --- | --- |
| Bibliothèque | Écran principal, le plus souvent ouvert |
| Ajout d'un livre | Formulaire le plus important ; parcours au clavier exigé par ENF-05 |
| Fiche d'un livre | Écran de l'objectif O2 (impressions) ; messages de confirmation |
| Création de compte | Écran d'un autre rôle, le visiteur ; règle du mot de passe (RG-02) |
| Statistiques | Écran le plus difficile : trois tableaux de données |

**Thématiques retenues** : les huit que citent les décisions ACC-01 à ACC-08, soit Couleurs, Tableaux, Scripts, Éléments obligatoires, Structuration de l'information, Présentation de l'information, Formulaires et Navigation.

## 2. Éco-conception

| ID | Décision | Thématique du RGESN (critères) | Effet attendu | Exigence |
| --- | --- | --- | --- | --- |
| ECO-01 | Chaque écran pèse moins de 500 Ko et fait moins de 30 requêtes à son chargement, cache vidé | Frontend ([6.1](https://ecoresponsable.numerique.gouv.fr/publications/referentiel-general-ecoconception/critere/6.1/)) | Environ cinq fois plus léger que la page web médiane de 2024 | ENF-03 |
| ECO-02 | La bibliothèque est paginée par 20 livres, sans défilement infini | UX/UI ([4.2](https://ecoresponsable.numerique.gouv.fr/publications/referentiel-general-ecoconception/critere/4.2/)) | Jamais plus de 20 livres chargés à la fois | ENF-03, ENF-05 |
| ECO-03 | Aucune image et aucune police téléchargée en version 1.0 | Contenus ([5.1](https://ecoresponsable.numerique.gouv.fr/publications/referentiel-general-ecoconception/critere/5.1/), [5.2](https://ecoresponsable.numerique.gouv.fr/publications/referentiel-general-ecoconception/critere/5.2/)) ; UX/UI ([4.8](https://ecoresponsable.numerique.gouv.fr/publications/referentiel-general-ecoconception/critere/4.8/)) | Aucune requête d'image ni de police | ENF-03 |
| ECO-04 | Le serveur n'envoie que les données affichées ; les comptes expirés sont effacés (ENF-02, RG-16) | Frontend ([6.5](https://ecoresponsable.numerique.gouv.fr/publications/referentiel-general-ecoconception/critere/6.5/)) ; Backend ([7.2](https://ecoresponsable.numerique.gouv.fr/publications/referentiel-general-ecoconception/critere/7.2/)) | Réponses légères ; aucun compte gardé sans usage | ENF-03, ENF-02 |
| ECO-05 | Chaque écran s'utilise à 360 px de large et avec une connexion 3G | Spécifications ([2.3](https://ecoresponsable.numerique.gouv.fr/publications/referentiel-general-ecoconception/critere/2.3/), [2.5](https://ecoresponsable.numerique.gouv.fr/publications/referentiel-general-ecoconception/critere/2.5/)) | Pas besoin d'un téléphone récent ni d'un bon réseau | ENF-06, ENF-03 |
