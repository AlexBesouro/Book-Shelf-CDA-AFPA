# Modèles logique et physique des données — Book Shelf

> Version 0.1 du 19/11/2026 · Auteur : Alex · Statut : brouillon
>
> Sources : [modèle conceptuel des données v0.2 du 19/11/2026](mcd.md) · [exigences v0.5 du 19/11/2026](exigences.md)

## 1. Modèle logique

Cinq tables. Clé primaire en gras ; clé étrangère précédée de `#`.

- users (**user_id**, username, email, password_hash, role, personal_code, last_login_on, deleted_on)
- books (**book_id**, #owner_id, title, author, genre, publication_year, original_language, reading_language, status, finished_on, rating, review)
- groups (**group_id**, #creator_id, group_name, group_description)
- contact_requests (**contact_request_id**, #sender_id, #recipient_id, contact_request_status)
- group_invitations (**#group_id, #user_id**, group_invitation_status)

| Élément du MCD | Règle de passage | Résultat |
| --- | --- | --- |
| Entités USER, BOOK, GROUP, CONTACT_REQUEST | Une entité devient une table ; son identifiant devient la clé primaire | `users`, `books`, `groups`, `contact_requests` |
| OWN : USER 0,n — 1,1 BOOK | La clé du côté 0,n migre dans la table du côté 1,1, en clé étrangère | `books.owner_id` |
| CREATE : USER 0,n — 1,1 GROUP | Même règle | `groups.creator_id` |
| SEND : USER 0,n — 1,1 CONTACT_REQUEST | Même règle | `contact_requests.sender_id` |
| RECEIVE : USER 0,n — 1,1 CONTACT_REQUEST | Même règle | `contact_requests.recipient_id` |
| INVITE : USER 0,n — 0,n GROUP | Une association plusieurs à plusieurs devient une table ; sa clé primaire réunit les clés des deux entités | `group_invitations`, clé (`group_id`, `user_id`) |
| `group_invitation_status`, propriété de INVITE | La propriété d'une association devient une colonne de sa table | `group_invitations.group_invitation_status` |

Le MCD n'a ni association 0,1 — 1,1, ni association à trois entités : les autres règles de passage ne servent pas.

**Comparaison avec Mocodo** : Mocodo 4.3.3, l'outil du MCD, génère aussi un modèle logique.

| Point comparé | Mocodo | Ce document | Choix |
| --- | --- | --- | --- |
| Tables et clés | 5 tables | Les mêmes tables, les mêmes clés primaires et étrangères | Aucun écart |
| Noms des tables | `USER`, `GROUP`, `INVITE` | `users`, `groups`, `group_invitations` | Ce document : `user` et `group` sont réservés par PostgreSQL (§ 2) |
| Noms des clés étrangères | `user_id`, `user_id_1`, `user_id_2` | `owner_id`, `creator_id`, `sender_id`, `recipient_id` | Ce document : le nom dit le rôle |
| Types et contraintes | `VARCHAR(42)` partout, aucune règle de gestion | Choisis colonne par colonne (§ 3) | Ce document |

## 2. Règles de nommage

| Objet | Règle | Exemples |
| --- | --- | --- |
| Tous les noms | En anglais, en minuscules, mots séparés par `_` | `contact_requests`, `last_login_on` |
| Schéma | Le nom du projet | `book_shelf` |
| Table | Le nom de l'entité, au pluriel | `users`, `books` |
| Table d'une association | Ce que contient une ligne, au pluriel | `group_invitations` |
| Colonne | Le code du dictionnaire des données, sans changement | `group_name`, `finished_on` |
| Clé primaire | L'identifiant de l'entité | `user_id`, `book_id` |
| Clé étrangère | `<rôle>_id` ; dans la table d'une association, le nom de la clé copiée | `owner_id`, `sender_id` ; `group_id` |
| Date | Suffixe `_on` | `finished_on`, `deleted_on` |
| Contrainte et index | `<table>_<objet>_<type>` ; types : `pk`, `fk`, `uk`, `ck`, `idx` ; clé primaire : `<table>_pk` | `users_email_uk`, `books_owner_fk`, `users_pk` |

Trois raisons, tirées de la documentation de PostgreSQL 18 :

- **Pluriel** : `user` et `group` sont des mots réservés, interdits comme noms de table ([mots-clés](https://www.postgresql.org/docs/18/sql-keywords-appendix.html)).
- **Minuscules** : un nom écrit sans guillemets est mis en minuscules ; une majuscule obligerait à écrire des guillemets partout ([identificateurs](https://www.postgresql.org/docs/18/sql-syntax-lexical.html)).
- **Contraintes nommées** : le message d'erreur cite le nom de la contrainte ([contraintes](https://www.postgresql.org/docs/18/ddl-constraints.html)).

## 3. Modèle physique

Le système de gestion de base de données est PostgreSQL 18.

**Types** :

| Donnée | Colonnes | Type | Justification |
| --- | --- | --- | --- |
| Identifiant | `user_id`, `book_id`, `group_id`, `contact_request_id` | `bigint GENERATED ALWAYS AS IDENTITY` | La base attribue la valeur, jamais l'application ([CREATE TABLE](https://www.postgresql.org/docs/18/sql-createtable.html)) |
| Clé étrangère | `owner_id`, `creator_id`, `sender_id`, `recipient_id` ; `group_id` et `user_id` de `group_invitations` | `bigint` | Le type de la clé copiée |
| Courriel | `email` | `varchar(254)` | La longueur maximale d'une adresse de courriel |
| Texte | `username`, `password_hash`, `title`, `author`, `genre`, `original_language`, `reading_language`, `review`, `group_name`, `group_description` | `text` | Aucune règle ne fixe de taille ; `text` est aussi rapide que `varchar` ([types caractères](https://www.postgresql.org/docs/18/datatype-character.html)) |
| Liste de valeurs | `role`, `status`, `contact_request_status`, `group_invitation_status` | `varchar` | Texte court ; une contrainte fixe les valeurs permises (RG-05, RG-17, RG-21, RG-28) |
| Code personnel | `personal_code` | `uuid` | Tiré au hasard par la base : impossible à deviner (RG-26) ([fonctions UUID](https://www.postgresql.org/docs/18/functions-uuid.html)) |
| Date | `finished_on`, `last_login_on`, `deleted_on` | `date` | Les règles comptent en jours et en années (RG-06, RG-16, ENF-02) |
| Année | `publication_year` | `smallint` | Un entier de −32768 à 32767 suffit ([types numériques](https://www.postgresql.org/docs/18/datatype-numeric.html)) |
| Note | `rating` | `smallint` | Un entier de 1 à 10 (RG-07) |

Aucun montant : aucun type à virgule. Aucune règle ne demande une heure : `timestamptz` ne sert pas.

**Colonnes obligatoires** (`NOT NULL`) : les autres colonnes peuvent rester vides.

| Table | Colonnes obligatoires | Justification |
| --- | --- | --- |
| `users` | `username`, `email`, `password_hash`, `role`, `personal_code`, `last_login_on` | EX-01, ENF-01, RG-17, RG-26 ; un compte créé est connecté (EX-01) |
| `books` | `owner_id`, `title`, `author`, `status` | Un livre a un propriétaire (RG-14), un titre (RG-04), un auteur (RG-36) et un statut (RG-05) |
| `groups` | `creator_id`, `group_name` | Un groupe a un créateur et un nom (EX-14) |
| `contact_requests` | `sender_id`, `recipient_id`, `contact_request_status` | Une demande a un auteur et un destinataire (EX-20) |
| `group_invitations` | `group_invitation_status` | Une invitation a toujours un statut (RG-21) |

Une clé primaire est toujours obligatoire.

**Listes de valeurs** (`CHECK`) : la valeur enregistrée est en anglais ; l'application affiche le texte français.

| Contrainte | Colonne | Valeurs enregistrées (texte affiché) | Par défaut | Règle |
| --- | --- | --- | --- | --- |
| `users_role_ck` | `users.role` | `reader` (lecteur), `admin` (administrateur) | `reader` | RG-17 |
| `books_status_ck` | `books.status` | `to_read` (« à lire »), `reading` (« en cours »), `read` (« lu ») | `to_read` | RG-05 |
| `contact_requests_status_ck` | `contact_requests.contact_request_status` | `pending` (« en attente »), `accepted` (« acceptée »), `refused` (« refusée ») | `pending` | RG-28 |
| `group_invitations_status_ck` | `group_invitations.group_invitation_status` | `pending`, `accepted`, `refused` | `pending` | RG-21 |

Deux autres valeurs par défaut : `personal_code` reçoit un code tiré au hasard (`gen_random_uuid()`), `last_login_on` la date du jour (`CURRENT_DATE`).

**Autres conditions** (`CHECK`) :

| Contrainte | Ce qu'elle garantit | Règle |
| --- | --- | --- |
| `users_username_ck`, `books_title_ck`, `books_author_ck`, `groups_name_ck` | Un texte obligatoire contient au moins un caractère autre qu'une espace | EX-01, RG-04, RG-36, EX-14 |
| `books_rating_ck` | Une note va de 1 à 10 | RG-07 |
| `books_finished_ck` | Un livre « lu » a une date de fin de lecture ; les autres n'en ont pas | RG-06 |
| `contact_requests_not_self_ck` | L'auteur d'une demande n'est pas son destinataire | RG-34 |

**Unicités** (`UNIQUE`) :

| Contrainte ou index | Ce qui ne peut pas exister deux fois | Règle |
| --- | --- | --- |
| `users_email_uk` | Un courriel, sans tenir compte des majuscules | RG-01 |
| `users_personal_code_uk` | Un code personnel | RG-26 |
| `books_duplicate_uk` | Un livre de même propriétaire, même titre, même auteur et même langue de lecture | RG-13 |
| `groups_name_uk` | Un nom de groupe | RG-18 |
| `contact_requests_active_uk` | Une demande en attente ou acceptée, du même auteur au même destinataire | RG-29 |
| `group_invitations_pk` | Une invitation du même utilisateur dans le même groupe | RG-20 |

Trois unicités demandent plus qu'un simple `UNIQUE` :

- `users_email_uk` est un index unique sur `lower(email)` ([index sur une expression](https://www.postgresql.org/docs/18/indexes-expressional.html)).
- `books_duplicate_uk` porte `NULLS NOT DISTINCT` : deux langues de lecture vides comptent pour la même ([contraintes d'unicité](https://www.postgresql.org/docs/18/ddl-constraints.html)).
- `contact_requests_active_uk` est un index unique partiel : il ignore les demandes refusées ([index partiels](https://www.postgresql.org/docs/18/indexes-partial.html)).

**Clés étrangères** : la ligne visée doit exister ; la colonne « À la suppression » dit ce que deviennent les lignes qui en dépendent ([clés étrangères](https://www.postgresql.org/docs/18/ddl-constraints.html)).

| Contrainte | Colonne et table visée | À la suppression | Justification |
| --- | --- | --- | --- |
| `books_owner_fk` | `books.owner_id` vers `users` | `CASCADE` | Les livres et les impressions sont effacés avec le compte (EX-09, RG-16) |
| `groups_creator_fk` | `groups.creator_id` vers `users` | `CASCADE` | Les groupes sont supprimés avec leur créateur (RG-35) |
| `contact_requests_sender_fk` | `contact_requests.sender_id` vers `users` | `CASCADE` | Les demandes et les contacts disparaissent avec le compte (RG-33, EX-09) |
| `contact_requests_recipient_fk` | `contact_requests.recipient_id` vers `users` | `CASCADE` | Même raison |
| `group_invitations_user_fk` | `group_invitations.user_id` vers `users` | `CASCADE` | Les invitations sont supprimées avec le compte (RG-35) |
| `group_invitations_group_fk` | `group_invitations.group_id` vers `groups` | `CASCADE` | Une invitation n'existe pas sans son groupe (RG-35) |

`CASCADE` six fois, par décision : rien ne reste d'un compte effacé (EX-09, ENF-02). `RESTRICT` bloquerait l'effacement ; `SET NULL` laisserait des livres sans propriétaire.

La note et le texte sont des colonnes de `books` : ils sont supprimés avec le livre (RG-09).

**Ce qui n'est pas dans le schéma** : ces règles seront du code et des tests.

| Règle | Pourquoi ce n'est pas une contrainte |
| --- | --- |
| Au plus 3 demandes de contact au même lecteur (RG-29) | C'est un compte sur plusieurs lignes |
| Effacement après 30 jours (RG-16), suppression après 2 ans sans connexion (ENF-02), date de fin mise au jour du passage à « lu » (RG-06) | Elles dépendent de la date du jour |
| Invitation réservée au créateur et à ses contacts (RG-31) ; sortie du groupe quand le contact est retiré (RG-30) | Elles dépendent d'une autre table |
| Suppression par l'administrateur : demandes en attente, groupes et invitations supprimés aussitôt (RG-33, RG-35) | La ligne du compte reste 30 jours : aucune cascade |
| Qui voit et modifie quoi (RG-03, RG-08, RG-14, RG-15, RG-17, RG-21, RG-26, RG-27, RG-32) | Elles dépendent de l'utilisateur connecté |
| Mot de passe d'au moins 12 caractères (RG-02), calcul de son empreinte (ENF-01) | La base ne reçoit que l'empreinte |
| Statistiques (RG-10, RG-11, RG-12) et membres d'un groupe (RG-19) | Calculés par des requêtes, jamais enregistrés |
| Livre du groupe et chapitres lus (RG-22 à RG-25) | Exigences « Could » : hors du modèle |

Aucun déclencheur : il cacherait la règle loin du code qui la teste.

## 4. Exécution et vérification

Trois scripts, exécutés dans le conteneur `db`, depuis la racine du dépôt, services démarrés (`docker compose up -d`) :

```bash
docker compose cp db/schema.sql db:/tmp/schema.sql
docker compose cp db/jeu-essai.sql db:/tmp/jeu-essai.sql
docker compose cp db/jeu-essai-refus.sql db:/tmp/jeu-essai-refus.sql
docker compose exec db sh -c 'psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -v ON_ERROR_STOP=1 -f /tmp/schema.sql'
docker compose exec db sh -c 'psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -v ON_ERROR_STOP=1 -f /tmp/jeu-essai.sql'
docker compose exec db sh -c 'psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f /tmp/jeu-essai-refus.sql'
```

`ON_ERROR_STOP=1` arrête un script à sa première erreur. Le dernier script s'exécute sans cette option : chacune de ses instructions doit échouer.

**Résultat attendu** :

| Script | Résultat |
| --- | --- |
| `schema.sql` | Aucune erreur : 5 tables et 2 index créés. Rejoué, il supprime les 5 tables puis les recrée |
| `jeu-essai.sql` | Aucune erreur : 17 lignes insérées, puis les 3 requêtes de vérification |
| `jeu-essai-refus.sql` | 12 erreurs, puis le compte des lignes, inchangé : 5, 7, 3, 1, 1 |

**Requêtes de vérification** : chacune calcule une donnée écartée du dictionnaire.

| Requête | Résultat |
| --- | --- |
| Livres lus par lea, par année de lecture (RG-10, RG-11) | 2026 : 3 ; 2025 : 1 |
| Membres du groupe « Classiques » (RG-19, RG-21) | lea, sa créatrice ; omar, invité |
| Comptes à effacer, supprimés depuis plus de 30 jours (RG-16) | paul |

**Refus vérifiés** : chaque message d'erreur cite la contrainte.

| Instruction refusée | Contrainte | Règle |
| --- | --- | --- |
| Le courriel `LEA@example.test`, quand `lea@example.test` existe | `users_email_uk` | RG-01 |
| Un identifiant choisi à la main | Colonne identité | — |
| Un livre sans auteur | `NOT NULL` de `author` | RG-36 |
| Le statut `abandoned` | `books_status_ck` | RG-05 |
| Une note de 15 | `books_rating_ck` | RG-07 |
| Un livre « lu » sans date de fin de lecture | `books_finished_ck` | RG-06 |
| Un livre déjà présent dans la même langue de lecture | `books_duplicate_uk` | RG-13 |
| Un livre dont le propriétaire n'existe pas | `books_owner_fk` | RG-14 |
| Une demande de contact à soi-même | `contact_requests_not_self_ck` | RG-34 |
| Une seconde demande en attente au même lecteur | `contact_requests_active_uk` | RG-29 |
| Un second groupe du même nom | `groups_name_uk` | RG-18 |
| Une invitation déjà faite | `group_invitations_pk` | RG-20 |

```text
ERROR:  new row for relation "books" violates check constraint "books_rating_ck"
DETAIL:  Failing row contains (10, 1, Germinal, Émile Zola, null, null, null, null, to_read, null, 15, null).
```

Résultats obtenus le 19/11/2026 avec PostgreSQL 18.6.
