# Backlog — Book Shelf

> Version 0.1 du 21/10/2026 · Source unique : base « Backlog » dans Notion · ce fichier en est l'export lisible, mis à jour à chaque fin d'étape.

## Product Backlog

| Ordre | ID | Titre | User story | Rôle | Épopée | MoSCoW | Points |
|---|---|---|---|---|---|---|---|
| 1 | US-01 | Créer un compte | En tant que visiteur, je veux créer un compte (pseudonyme, courriel, mot de passe), afin de garder mes lectures d'une visite à l'autre | Visiteur | Compte | Must | 5 |
| 2 | US-02 | Se connecter | En tant que lecteur, je veux me connecter et me déconnecter, afin d'accéder à ma bibliothèque en sécurité | Lecteur | Compte | Must | 5 |
| 3 | US-03 | Ajouter un livre | En tant que lecteur, je veux ajouter un livre (titre, auteur, genre, langue) avec son statut, afin de ne plus oublier les titres qu'on me recommande | Lecteur | Bibliothèque | Must | 3 |
| 4 | US-04 | Consulter ma bibliothèque | En tant que lecteur, je veux voir la liste de mes livres, afin d'avoir toutes mes lectures au même endroit | Lecteur | Bibliothèque | Must | 3 |
| 5 | US-05 | Changer le statut | En tant que lecteur, je veux changer le statut d'un livre (à lire, en cours, lu), afin de suivre où j'en suis | Lecteur | Bibliothèque | Must | 2 |
| 6 | US-06 | Écrire mes impressions | En tant que lecteur, je veux noter un livre sur 10, écrire mon ressenti et des citations, afin de m'en souvenir plus tard | Lecteur | Impressions | Must | 3 |
| 7 | US-07 | Fiche d'un livre | En tant que lecteur, je veux ouvrir la fiche d'un livre, afin de retrouver mes impressions rapidement | Lecteur | Impressions | Must | 2 |
| 8 | US-08 | Statistiques | En tant que lecteur, je veux voir le nombre de livres lus par année, par auteur et par genre, afin d'avoir une vue d'ensemble de mes lectures | Lecteur | Statistiques | Must | 5 |
| 9 | US-09 | Supprimer mon compte | En tant que lecteur, je veux supprimer mon compte, afin que mes données ne soient plus conservées | Lecteur | Compte | Must | 3 |
| 10 | US-10 | Modifier ou supprimer un livre | En tant que lecteur, je veux modifier ou supprimer un livre, afin de corriger une erreur de saisie | Lecteur | Bibliothèque | Should | 2 |
| 11 | US-11 | Supprimer ou restaurer un compte | En tant qu'administrateur, je veux supprimer le compte d'un autre utilisateur ou le restaurer dans les 30 jours, afin d'écarter un usage abusif sans perdre de données par erreur | Administrateur | Administration | Should | 5 |
| 12 | US-12 | Créer un groupe | En tant que lecteur, je veux créer un groupe de lecture (nom, description), afin de lire avec d'autres | Lecteur | Groupes | Should | 3 |
| 13 | US-13 | Rejoindre un groupe | En tant que lecteur, je veux rejoindre un groupe, afin de participer à une lecture commune | Lecteur | Groupes | Should | 2 |
| 14 | US-14 | Rechercher et filtrer | En tant que lecteur, je veux rechercher par titre ou auteur et filtrer par statut, genre ou langue, afin de retrouver un livre dans une grande bibliothèque | Lecteur | Bibliothèque | Could | 3 |
| 15 | US-15 | Livre et rythme du groupe | En tant que créateur d'un groupe, je veux choisir le livre et un objectif de rythme (ex. 3 chapitres par semaine), afin de donner un cadre commun | Lecteur | Groupes | Could | 3 |
| 16 | US-16 | Progression dans le groupe | En tant que membre d'un groupe, je veux indiquer ma progression et voir celle des autres, afin de garder le rythme ensemble | Lecteur | Groupes | Could | 5 |
| — | US-17 | Fonctions sociales | En tant que lecteur, je veux suivre d'autres lecteurs, commenter et discuter dans les groupes | Lecteur | Hors périmètre | Won't (v1) | — |
| — | US-18 | Recommandations | En tant que lecteur, je veux recevoir des recommandations automatiques de livres | Lecteur | Hors périmètre | Won't (v1) | — |
| — | US-19 | Liens boutiques | En tant que lecteur, je veux acheter un livre ou voir où l'acheter | Lecteur | Hors périmètre | Won't (v1) | — |

**Répartition** : 16 stories, 54 points → Must 31 points (57 %, sous les 60 %), Should 12 points (22 %), Could 11 points (20 %, la réserve). Aucune story à 8 points ou plus : rien à découper.

## Estimations

Échelle : 1, 2, 3, 5, 8, 13. **Story de référence : US-03 Ajouter un livre = 3 points** (un formulaire, ses validations, un enregistrement).

| Story | Points | Justification par comparaison |
|---|---|---|
| US-01 Créer un compte | 5 | Plus grosse que la référence : hachage Argon2, unicité du courriel, première mise en place de l'authentification |
| US-02 Se connecter | 5 | Plus grosse : session ou jeton, déconnexion, protection de toutes les routes ; technique nouvelle pour moi |
| US-03 Ajouter un livre | 3 | Référence |
| US-04 Consulter ma bibliothèque | 3 | Comparable : une lecture paginée, avec le contrôle du propriétaire |
| US-05 Changer le statut | 2 | Plus petite : une modification d'un seul champ, plus la date de fin |
| US-06 Écrire mes impressions | 3 | Comparable : un formulaire et ses validations, avec plusieurs citations |
| US-07 Fiche d'un livre | 2 | Plus petite : une lecture, sans règle nouvelle |
| US-08 Statistiques | 5 | Plus grosse : trois regroupements (année, auteur, genre) et une vue de synthèse |
| US-09 Supprimer mon compte | 3 | Comparable : confirmation par mot de passe et suppression en cascade des données |
| US-10 Modifier ou supprimer un livre | 2 | Plus petite : réutilise le formulaire de US-03 |
| US-11 Supprimer ou restaurer un compte | 5 | Plus grosse : rôle administrateur, suppression logique, restauration et délai de 30 jours |
| US-12 Créer un groupe | 3 | Comparable : un formulaire et ses validations |
| US-13 Rejoindre un groupe | 2 | Plus petite : une relation lecteur–groupe, sans règle complexe |
| US-14 Rechercher et filtrer | 3 | Comparable : des paramètres de requête sur la liste de US-04 |
| US-15 Livre et rythme du groupe | 3 | Comparable : un formulaire réservé au créateur du groupe |
| US-16 Progression dans le groupe | 5 | Plus grosse : saisie par membre, vue de tous les membres, visibilité limitée au groupe |
| US-17 à US-19 | — | Won't : on n'estime pas ce qu'on ne fera pas |

**À estimer à deux au prochain bilan** (vote simultané avec le formateur) : US-01, US-02, US-08, US-09, les Must où l'incertitude est la plus forte.


## User stories détaillées (Must)

### US-01 — Créer un compte

En tant que visiteur, je veux créer un compte (pseudonyme, courriel, mot de passe), afin de garder mes lectures d'une visite à l'autre.

- **Étant donné** le courriel alex@mail.fr non utilisé, **quand** je m'inscris avec le pseudonyme « alex42 » et un mot de passe de 12 caractères, **alors** mon compte est créé et je suis connecté.
- **Étant donné** le courriel alex@mail.fr déjà utilisé, **quand** je m'inscris avec, **alors** le message « Ce courriel est déjà utilisé » s'affiche et aucun compte n'est créé.
- Un mot de passe de moins de 12 caractères est refusé, avec un message qui rappelle la règle.
- Seuls le pseudonyme, le courriel et le mot de passe sont demandés.

*Questions ouvertes* : faut-il confirmer le courriel ? Le pseudonyme doit-il être unique ?

### US-02 — Se connecter

En tant que lecteur, je veux me connecter et me déconnecter, afin d'accéder à ma bibliothèque en sécurité.

- **Étant donné** le compte alex@mail.fr, **quand** je saisis le bon mot de passe, **alors** j'arrive sur ma bibliothèque.
- **Étant donné** un mauvais mot de passe, **quand** je valide, **alors** le message « Courriel ou mot de passe incorrect » s'affiche, sans dire lequel est faux.
- Un compte supprimé par l'administrateur ne peut pas se connecter : message « Courriel ou mot de passe incorrect ».
- Après déconnexion, l'adresse de la bibliothèque renvoie vers la page de connexion.

*Questions ouvertes* : durée d'une session ? Limiter à 5 essais en 15 minutes ?

### US-03 — Ajouter un livre

En tant que lecteur, je veux ajouter un livre (titre, auteur, genre, langue) avec son statut, afin de ne plus oublier les titres qu'on me recommande.

- **Étant donné** une bibliothèque vide, **quand** j'ajoute « L'Étranger », Albert Camus, roman, français, « à lire », **alors** il apparaît dans ma bibliothèque avec ce statut.
- **Étant donné** un titre vide, **quand** je valide, **alors** le livre n'est pas ajouté et le champ « Titre » est signalé.
- « L'Étranger » (français) et « The Stranger » (anglais) sont deux livres distincts.
- Sans statut choisi, le livre est « à lire ».

*Questions ouvertes* : genres en liste fermée ou texte libre ? Même titre dans la même langue : refusé ou simple avertissement ?

### US-04 — Consulter ma bibliothèque

En tant que lecteur, je veux voir la liste de mes livres, afin d'avoir toutes mes lectures au même endroit.

- **Étant donné** 25 livres dans ma bibliothèque, **quand** je l'ouvre, **alors** 20 livres s'affichent et la page 2 en contient 5.
- Chaque livre affiche son titre, son auteur, sa langue et son statut.
- **Étant donné** l'identifiant d'un livre d'un autre lecteur, **quand** je l'appelle dans l'adresse, **alors** la réponse est 404.
- Bibliothèque vide : le message « Ajoutez votre premier livre » s'affiche avec un lien vers l'ajout.

*Questions ouvertes* : ordre par défaut (dernier ajouté, titre) ?

### US-05 — Changer le statut

En tant que lecteur, je veux changer le statut d'un livre (à lire, en cours, lu), afin de suivre où j'en suis.

- **Étant donné** « L'Étranger » à lire, **quand** je le passe « en cours », **alors** son nouveau statut s'affiche dans la bibliothèque.
- **Quand** un livre passe « lu », **alors** la date de fin de lecture est enregistrée (date du jour, modifiable).
- **Étant donné** un statut hors liste (« abandonné »), **quand** il est envoyé à l'API, **alors** il est refusé (erreur 422).

*Questions ouvertes* : ajouter le statut « abandonné » ? Saisir une date passée pour les livres lus avant l'inscription ?

### US-06 — Écrire mes impressions

En tant que lecteur, je veux noter un livre sur 10, écrire mon ressenti et des citations, afin de m'en souvenir plus tard.

- **Étant donné** « L'Étranger » lu, **quand** j'enregistre la note 8, un ressenti et 2 citations, **alors** ils sont rattachés à ce livre.
- **Étant donné** la note 11, **quand** je valide, **alors** elle est refusée avec le message « La note va de 0 à 10 ».
- Les impressions restent modifiables.
- Les impressions ne sont visibles que par leur auteur.

*Questions ouvertes* : impressions possibles sur un livre « à lire » ? Longueur maximale du ressenti ?

### US-07 — Fiche d'un livre

En tant que lecteur, je veux ouvrir la fiche d'un livre, afin de retrouver mes impressions rapidement.

- **Étant donné** ma bibliothèque ouverte, **quand** je clique sur « L'Étranger », **alors** sa fiche affiche ses informations, sa note, son ressenti et ses citations.
- Livre sans impressions : « Pas encore d'impressions » et un bouton pour en écrire.
- **Étant donné** un identifiant inexistant ou d'un autre lecteur, **quand** j'ouvre la fiche, **alors** la page « Livre introuvable » s'affiche (404).

*Questions ouvertes* : afficher les citations en entier ou repliées ?

### US-08 — Statistiques

En tant que lecteur, je veux voir le nombre de livres lus par année, par auteur et par genre, afin d'avoir une vue d'ensemble de mes lectures.

- **Étant donné** 3 livres lus en 2026 (dont 2 de Camus) et 1 en 2025, **quand** j'ouvre mes statistiques, **alors** je vois 2026 : 3, 2025 : 1 et Albert Camus : 2.
- Seuls les livres au statut « lu » sont comptés.
- **Étant donné** aucun livre lu, **quand** j'ouvre la page, **alors** le message « Pas encore de livre lu » remplace les tableaux.
- Les trois vues tiennent sur une seule page.

*Questions ouvertes* : tableaux simples ou graphiques ? Mettre en cache dans Redis ?

### US-09 — Supprimer mon compte

En tant que lecteur, je veux supprimer mon compte, afin que mes données ne soient plus conservées.

- **Étant donné** mon compte avec 10 livres, **quand** je confirme la suppression avec mon mot de passe, **alors** compte, livres et impressions sont effacés et je suis déconnecté.
- **Étant donné** un mauvais mot de passe, **quand** je confirme, **alors** la suppression est refusée.
- Après suppression, la connexion avec ce courriel échoue (« Courriel ou mot de passe incorrect »).

*Questions ouvertes* : que deviennent un groupe que j'ai créé et ma progression dans les groupes ?

## Couverture des objectifs

| Objectif de la note de cadrage | Stories |
|---|---|
| Ajouter un livre avec son statut en moins de 1 minute | US-03, US-04, US-05, US-10 |
| Impressions affichées en 2 clics depuis la bibliothèque | US-06, US-07, US-14 (Could) |
| Livres lus par année, auteur et genre sur une seule page | US-08 (et la date de fin de US-05) |
| Groupes de lecture (périmètre) | US-12, US-13 (Should), US-15, US-16 (Could) |
| Administration des comptes | US-11 (Should) |
| RGPD : suppression du compte, durée de conservation | US-09, US-11 |
| Hors périmètre : social, recommandations, boutiques | US-17, US-18, US-19, Won't (v1) |

Non couvert, par décision : application mobile native (pas de story ; site utilisable dès 360 px, inscrit dans la DoD). Les exigences non fonctionnelles (sécurité, accessibilité, éco-conception) sont dans la DoD, pas en stories.

## Ordre

- **Dépendances** : le compte (US-01, US-02) précède tout, car chaque donnée appartient à un lecteur ; on ne change pas le statut d'un livre qui n'existe pas (US-03 avant US-05).
- **Valeur** : la bibliothèque, les impressions et les statistiques (US-03 à US-08) portent les trois objectifs de la note de cadrage ; elles passent avant les groupes.
- **Risque** : les groupes, plus complexes (plusieurs lecteurs sur un même livre), viennent après la bibliothèque, comme le prévoit la parade du risque 4, avec la progression en Could comme repli.
- **Urgence** : US-09 (suppression du compte) est un Must avant l'arrivée des testeurs, car leurs données réelles doivent pouvoir être effacées.
- **Précision** : au sens strict, le MVP est l'ensemble des Must ; la version 1.0 vise aussi les Should, et les Could forment la réserve si le temps manque.
