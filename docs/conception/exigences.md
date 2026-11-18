# Exigences — Book Shelf

> Version 0.4 du 18/11/2026 · Auteur : Alex · Statut : brouillon
>
> Sources : [note de cadrage v0.3 du 17/11/2026](../note-de-cadrage.md) · [backlog v0.3 du 18/11/2026](../backlog.md) · échanges : aucun à ce jour

**Objectifs de la [note de cadrage, § 2](../note-de-cadrage.md#2-objectifs)**, cités dans ce document :

- **O1** : centraliser ses lectures au même endroit ;
- **O2** : retrouver ses impressions de lecture ;
- **O3** : avoir une vue d'ensemble de ses lectures.

## 1. Exigences fonctionnelles

| ID | Exigence | Priorité | Source | Vérification |
| --- | --- | --- | --- | --- |
| EX-01 | Le visiteur crée un compte avec un pseudonyme, un courriel et un mot de passe | Must | [Note de cadrage § 4 (périmètre)](../note-de-cadrage.md#4-périmètre) | Avec un courriel jamais utilisé, le compte est créé et le visiteur est connecté |
| EX-02 | Le lecteur se connecte à son compte et s'en déconnecte | Must | [Note de cadrage § 4 (périmètre)](../note-de-cadrage.md#4-périmètre) | Bon courriel et bon mot de passe : sa bibliothèque s'affiche. Après déconnexion, l'adresse de la bibliothèque renvoie vers la page de connexion |
| EX-03 | Le lecteur ajoute un livre (titre, auteur, genre, année de publication, langue d'origine, langue de lecture) à sa bibliothèque, avec un statut | Must | [Note de cadrage § 2, objectif O1](../note-de-cadrage.md#2-objectifs) · [§ 4 (périmètre)](../note-de-cadrage.md#4-périmètre) | « L'Étranger », Albert Camus, roman, 1942, français (origine), anglais (lecture), « à lire » : le livre apparaît dans la bibliothèque avec ce statut, en moins de 1 minute de saisie |
| EX-04 | Le lecteur consulte la liste de ses livres | Must | [Note de cadrage § 2, objectif O1](../note-de-cadrage.md#2-objectifs) | Avec 25 livres enregistrés, les 25 sont consultables, chacun avec son titre, son auteur, sa langue d'origine, sa langue de lecture et son statut ; le même livre lu en deux langues apparaît deux fois |
| EX-05 | Le lecteur change le statut d'un livre (à lire, en cours, lu) | Must | [Note de cadrage § 2, objectif O1](../note-de-cadrage.md#2-objectifs) | « L'Étranger » passe de « en cours » à « lu » : le nouveau statut s'affiche dans la bibliothèque, avec la date du jour comme date de fin de lecture |
| EX-06 | Le lecteur enregistre ses impressions sur un livre : une note sur 10 et un seul texte, pour son ressenti et ses citations | Must | [Note de cadrage § 2, objectif O2](../note-de-cadrage.md#2-objectifs) (décision du 18/11/2026) | Note 8 et un texte avec 2 citations enregistrés pour « L'Étranger » : ils s'affichent sur la fiche de ce livre |
| EX-07 | Le lecteur consulte la fiche d'un livre, avec ses impressions | Must | [Note de cadrage § 2, objectif O2](../note-de-cadrage.md#2-objectifs) | Depuis la bibliothèque, la note, le ressenti et les citations de « L'Étranger » s'affichent en 2 clics au plus |
| EX-08 | Le lecteur consulte le nombre de livres qu'il a lus, par année de lecture, par auteur et par genre | Must | [Note de cadrage § 2, objectif O3](../note-de-cadrage.md#2-objectifs) | Avec 3 livres lus en 2026 (dont 2 de Camus) et 1 en 2025, une seule page affiche 2026 : 3, 2025 : 1 et Albert Camus : 2 ; le même livre lu en français en 2025 et en anglais en 2026 compte dans chacune des deux années, et deux fois pour son auteur et son genre |
| EX-09 | Le lecteur supprime son compte | Must | [Note de cadrage § 5 (RGPD)](../note-de-cadrage.md#5-exigences-non-fonctionnelles) | Après confirmation avec son mot de passe, son compte, ses livres et ses impressions sont effacés ; la connexion avec ce courriel échoue |
| EX-10 | Le lecteur modifie les informations d'un livre | Should | [Backlog, US-10](../backlog.md#product-backlog) | Le titre « L'Etranger » est corrigé en « L'Étranger » : la bibliothèque affiche le titre corrigé |
| EX-11 | Le lecteur supprime un livre de sa bibliothèque | Should | [Backlog, US-10](../backlog.md#product-backlog) | « L'Étranger » supprimé n'apparaît plus dans la bibliothèque ni dans les statistiques |
| EX-12 | L'administrateur supprime le compte d'un lecteur | Should | [Note de cadrage § 4 (périmètre)](../note-de-cadrage.md#4-périmètre) | Le lecteur dont le compte est supprimé ne peut plus se connecter : le message « Courriel ou mot de passe incorrect » s'affiche |
| EX-13 | L'administrateur restaure un compte supprimé (EX-12) | Should | [Note de cadrage § 4 (périmètre)](../note-de-cadrage.md#4-périmètre) | Compte restauré 10 jours après sa suppression : le lecteur se connecte et retrouve ses livres et ses impressions |
| EX-14 | Le lecteur crée un groupe de lecture, avec un nom et une description | Should | [Note de cadrage § 4 (périmètre)](../note-de-cadrage.md#4-périmètre) | Le groupe « Classiques » créé apparaît parmi les groupes de son créateur, qui en est membre ; un lecteur qui n'en est pas membre ne le voit pas |
| EX-15 | Le lecteur rejoint un groupe de lecture en acceptant l'invitation de son créateur, ou refuse cette invitation | Should | [Note de cadrage § 4 (périmètre)](../note-de-cadrage.md#4-périmètre) | Invité dans « Classiques », le lecteur accepte : il figure dans la liste des membres du groupe ; s'il refuse, il n'y figure pas |
| EX-16 | Le créateur d'un groupe supprime son groupe | Could | [Backlog, US-20](../backlog.md#product-backlog) (décision du 16/11/2026) | « Classiques » supprimé n'apparaît plus parmi les groupes de ses membres ; son livre reste dans la bibliothèque de chaque membre, « en cours » ou « lu » selon son avancement |
| EX-17 | Le lecteur recherche un livre de sa bibliothèque par titre ou par auteur, et filtre la liste par statut, genre, année de publication, année de lecture, langue d'origine ou langue de lecture | Could | [Note de cadrage § 4 (périmètre)](../note-de-cadrage.md#4-périmètre) | La recherche « camus » n'affiche que les livres d'Albert Camus ; « L'Étranger », publié en 1942, écrit en français et lu en anglais en 2026, s'affiche avec les filtres année de publication « 1942 » et langue d'origine « français », pas avec les filtres année de lecture « 1942 » ni langue de lecture « français » |
| EX-18 | Le créateur d'un groupe choisit le livre du groupe et un objectif de rythme | Could | [Note de cadrage § 4 (périmètre)](../note-de-cadrage.md#4-périmètre) · [Backlog, US-15](../backlog.md#product-backlog) | Le créateur de « Classiques » choisit « L'Étranger » et « 3 chapitres par semaine » : les deux s'affichent sur la page du groupe, pour tous ses membres |
| EX-19 | Le membre d'un groupe indique et modifie le nombre de chapitres qu'il a lus dans le livre du groupe, et consulte celui des autres membres | Could | [Note de cadrage § 4 (périmètre)](../note-de-cadrage.md#4-périmètre) | Un membre de « Classiques » indique 3 chapitres lus, puis corrige en 4 : la page du groupe affiche 4 pour lui, avec le nombre de chaque autre membre ; un lecteur qui n'est pas membre ne voit aucun nombre |
| EX-20 | Le lecteur envoie une demande de contact à un autre lecteur, grâce au code personnel de celui-ci | Should | [Note de cadrage § 4 (périmètre)](../note-de-cadrage.md#4-périmètre) (décision du 16/11/2026) | Avec le code personnel de « marie33 », la demande est envoyée et « marie33 » la voit ; avec un code qui n'existe pas, aucune demande n'est envoyée |
| EX-21 | Le lecteur accepte ou refuse une demande de contact | Should | [Note de cadrage § 4 (périmètre)](../note-de-cadrage.md#4-périmètre) (décision du 16/11/2026) | « marie33 » accepte : chacun figure dans les contacts de l'autre, sans voir ses livres, ses impressions ni ses statistiques ; si elle refuse, aucun contact n'est créé |
| EX-22 | Le créateur d'un groupe invite un de ses contacts dans son groupe | Should | [Note de cadrage § 4 (périmètre)](../note-de-cadrage.md#4-périmètre) (décision du 16/11/2026) | Le créateur de « Classiques » invite « marie33 », qui est dans ses contacts : elle voit l'invitation ; un lecteur qui n'est pas dans ses contacts ne peut pas être invité |
| EX-23 | Le visiteur ou le lecteur recherche un livre dans la vitrine, par titre ou par auteur | Could | [Note de cadrage § 4 (périmètre)](../note-de-cadrage.md#4-périmètre) (décision du 16/11/2026) | Sans compte, la recherche « camus » dans la vitrine affiche des livres d'Albert Camus, chacun avec son titre et son auteur |
| EX-24 | Le lecteur retire un de ses contacts | Should | [Backlog, US-22](../backlog.md#product-backlog) (décision du 16/11/2026) | Le lecteur retire « marie33 » : elle n'apparaît plus dans ses contacts, et lui n'apparaît plus dans ceux de « marie33 » |

### Hors périmètre (version 1.0)

Ces fonctions sont écartées de la version 1.0. Elles sont écrites ici pour ne pas revenir sans décision.

| Fonction écartée | Raison | Source |
| --- | --- | --- |
| Autres fonctions sociales : suivre d'autres lecteurs, commenter, messagerie dans les groupes | Elles doubleraient le périmètre et demandent de la modération | [Note de cadrage § 4 (exclus)](../note-de-cadrage.md#4-périmètre) · [Backlog, US-17](../backlog.md#product-backlog) |
| Recommandations automatiques de livres | Hors de portée d'un MVP | [Note de cadrage § 4 (exclus)](../note-de-cadrage.md#4-périmètre) · [Backlog, US-18](../backlog.md#product-backlog) |
| Achat ou liens vers des boutiques | Hors du besoin, qui est de garder une trace de ses lectures | [Note de cadrage § 4 (exclus)](../note-de-cadrage.md#4-périmètre) · [Backlog, US-19](../backlog.md#product-backlog) |
| Application mobile native | Un site adapté au téléphone suffit | [Note de cadrage § 4 (exclus)](../note-de-cadrage.md#4-périmètre) |
| Statistiques par langue | Pas un besoin : l'objectif O3 demande l'année, l'auteur et le genre | [Décision du 16/11/2026](#5-historique) |

## 2. Règles de gestion

Une règle de gestion est toujours vraie, quel que soit l'écran. Son type est la question qui l'a fait sortir : combien, quand, qui, et si.

| ID | Règle | Type | Exigences | Source |
| --- | --- | --- | --- | --- |
| RG-01 | Un courriel n'est utilisé que par un seul compte | Combien | EX-01 | [Backlog, US-01](../backlog.md#us-01--créer-un-compte) |
| RG-02 | Un mot de passe compte au moins 12 caractères | Combien | EX-01 | [Backlog, US-01](../backlog.md#us-01--créer-un-compte) |
| RG-03 | Une connexion refusée ne révèle pas sa cause : la réponse est la même pour un courriel inconnu, un mot de passe faux ou un compte supprimé | Et si | EX-02, EX-09, EX-12 | [Backlog, US-02](../backlog.md#us-02--se-connecter) |
| RG-04 | Un livre a toujours un titre : sans titre, il n'est ni ajouté ni modifié | Et si | EX-03, EX-10 | [Backlog, US-03](../backlog.md#us-03--ajouter-un-livre) |
| RG-05 | Le statut d'un livre est toujours « à lire », « en cours » ou « lu » ; sans choix du lecteur, c'est « à lire » | Et si | EX-03, EX-05 | [Backlog, US-03](../backlog.md#us-03--ajouter-un-livre) · [US-05](../backlog.md#us-05--changer-le-statut) |
| RG-06 | Quand un livre passe « lu », ou est ajouté avec ce statut, sa date de fin de lecture est enregistrée : la date du jour, que le lecteur peut modifier | Quand | EX-03, EX-05, EX-08 | [Backlog, US-05](../backlog.md#us-05--changer-le-statut) (décision du 17/11/2026) |
| RG-07 | La note d'un livre va de 1 à 10 | Combien | EX-06 | [Backlog, US-06](../backlog.md#us-06--écrire-mes-impressions) (décision du 16/11/2026) |
| RG-08 | Les impressions ne sont visibles et modifiables que par le lecteur qui les a écrites | Qui | EX-06, EX-07 | [Backlog, US-06](../backlog.md#us-06--écrire-mes-impressions) · [Note de cadrage § 5 (RGPD)](../note-de-cadrage.md#5-exigences-non-fonctionnelles) |
| RG-09 | Quand un livre est supprimé, ses impressions (note, ressenti, citations) sont supprimées avec lui | Quand | EX-11 | [Backlog, US-10](../backlog.md#product-backlog) |
| RG-10 | Seuls les livres au statut « lu » sont comptés dans les statistiques | Et si | EX-08 | [Backlog, US-08](../backlog.md#us-08--statistiques) |
| RG-11 | Un livre est compté dans l'année de sa date de fin de lecture, jamais dans son année de publication | Quand | EX-08 | [Note de cadrage § 4 (périmètre)](../note-de-cadrage.md#4-périmètre) (décision du 16/11/2026) |
| RG-12 | Les statistiques comptent chaque livre « lu » une seule fois ; le même livre lu dans deux langues est deux livres, et compte deux fois | Combien | EX-08 | [Backlog, US-08](../backlog.md#us-08--statistiques) (décisions du 16/11/2026 et du 18/11/2026) |
| RG-13 | Le même livre lu dans une autre langue est un autre livre de la bibliothèque ; un livre de même titre, même auteur et même langue de lecture qu'un livre déjà présent est refusé | Combien | EX-03, EX-04 | [Backlog, US-03](../backlog.md#us-03--ajouter-un-livre) · [US-04](../backlog.md#us-04--consulter-ma-bibliothèque) (décisions du 17/11/2026 et du 18/11/2026) |
| RG-14 | Un lecteur ne voit, ne modifie et ne supprime que ses propres livres | Qui | EX-04, EX-05, EX-07, EX-10, EX-11 | [Backlog, US-04](../backlog.md#us-04--consulter-ma-bibliothèque) · [Note de cadrage § 5 (sécurité)](../note-de-cadrage.md#5-exigences-non-fonctionnelles) |
| RG-15 | Un lecteur ne supprime son compte qu'après l'avoir confirmé avec son mot de passe : avec un mauvais mot de passe, rien n'est supprimé | Et si | EX-09 | [Backlog, US-09](../backlog.md#us-09--supprimer-mon-compte) |
| RG-16 | Un compte supprimé par l'administrateur est restaurable pendant 30 jours ; passé ce délai, il est effacé définitivement, avec ses livres et ses impressions | Quand | EX-12, EX-13 | [Note de cadrage § 4 (périmètre)](../note-de-cadrage.md#4-périmètre) · [§ 5 (RGPD)](../note-de-cadrage.md#5-exigences-non-fonctionnelles) |
| RG-17 | Seul un administrateur supprime ou restaure le compte d'une autre personne | Qui | EX-12, EX-13 | [Note de cadrage § 3 (rôles)](../note-de-cadrage.md#3-utilisateurs-rôles-et-parties-prenantes) · [§ 5 (sécurité)](../note-de-cadrage.md#5-exigences-non-fonctionnelles) |
| RG-18 | Deux groupes ne portent jamais le même nom | Combien | EX-14 | [Backlog, US-12](../backlog.md#product-backlog) (décision du 16/11/2026) |
| RG-19 | Un lecteur crée autant de groupes qu'il veut ; il est membre de chaque groupe qu'il crée | Combien | EX-14 | [Backlog, US-12](../backlog.md#product-backlog) (décision du 16/11/2026) |
| RG-20 | Un lecteur ne figure qu'une fois parmi les membres d'un groupe | Combien | EX-15 | [Backlog, US-13](../backlog.md#product-backlog) |
| RG-21 | Personne n'entre dans un groupe sans l'avoir accepté : le lecteur invité accepte ou refuse lui-même l'invitation | Qui | EX-15, EX-22 | [Note de cadrage § 4 (périmètre)](../note-de-cadrage.md#4-périmètre) (décision du 16/11/2026) |
| RG-22 | Seul le créateur d'un groupe choisit le livre et l'objectif de rythme du groupe | Qui | EX-18 | [Backlog, US-15](../backlog.md#product-backlog) |
| RG-23 | Le nombre de chapitres lus par un membre n'est visible que des membres de son groupe ; chaque membre ne modifie que le sien | Qui | EX-19 | [Note de cadrage § 5 (RGPD)](../note-de-cadrage.md#5-exigences-non-fonctionnelles) · [Backlog, US-16](../backlog.md#product-backlog) (décision du 16/11/2026) |
| RG-24 | Le nombre de chapitres lus par un membre va de 0 au nombre de chapitres du livre du groupe ; il peut augmenter ou diminuer | Combien | EX-18, EX-19 | [Backlog, US-16](../backlog.md#product-backlog) (décision du 16/11/2026) |
| RG-25 | Quand un groupe est supprimé par son créateur, ou qu'un membre le quitte, le membre garde le livre du groupe dans sa bibliothèque : « en cours » s'il ne l'a pas fini, « lu » sinon | Quand | EX-16, EX-24 | [Backlog, US-20](../backlog.md#product-backlog) (décision du 16/11/2026) |
| RG-26 | Chaque lecteur a un seul code personnel, différent de celui de tous les autres, et lui seul le voit | Combien | EX-20 | [Note de cadrage § 4 (périmètre)](../note-de-cadrage.md#4-périmètre) (décision du 16/11/2026) |
| RG-27 | Un contact ne montre de l'autre lecteur que son pseudonyme : ni ses livres, ni ses impressions, ni ses statistiques | Qui | EX-20, EX-21 | [Note de cadrage § 4 (périmètre)](../note-de-cadrage.md#4-périmètre) · [§ 5 (RGPD)](../note-de-cadrage.md#5-exigences-non-fonctionnelles) (décision du 16/11/2026) |
| RG-28 | Un contact n'existe qu'à partir du moment où la demande est acceptée ; il vaut alors pour les deux lecteurs | Quand | EX-20, EX-21, EX-22 | [Note de cadrage § 4 (périmètre)](../note-de-cadrage.md#4-périmètre) (décision du 16/11/2026) |
| RG-29 | Après un refus, l'auteur de la demande de contact en est informé par courriel et peut envoyer une nouvelle demande, dans la limite de 3 demandes au même lecteur | Et si | EX-20, EX-21 | [Backlog, US-22](../backlog.md#product-backlog) (décisions du 16/11/2026 et du 17/11/2026) |
| RG-30 | Quand le contact entre un membre et le créateur d'un groupe est retiré, par l'un ou par l'autre, le membre quitte ce groupe et son nombre de chapitres lus n'y est plus affiché ; retirer un autre contact ne change pas ses groupes | Quand | EX-15, EX-19, EX-24 | [Backlog, US-22](../backlog.md#product-backlog) (décision du 16/11/2026) |
| RG-31 | Seul le créateur d'un groupe y invite, et seulement des lecteurs qui sont dans ses contacts | Qui | EX-22 | [Note de cadrage § 4 (périmètre)](../note-de-cadrage.md#4-périmètre) (décision du 16/11/2026) |
| RG-32 | Un groupe (sa page, ses membres, leur nombre de chapitres lus) n'est visible que de ses membres | Qui | EX-14, EX-15, EX-19 | [Note de cadrage § 4 (périmètre)](../note-de-cadrage.md#4-périmètre) (décision du 16/11/2026) |
| RG-33 | Quand un compte est supprimé, les demandes de contact en attente qu'il a envoyées ou reçues sont supprimées avec lui | Quand | EX-09, EX-12, EX-21 | [Diagramme d'activité, § 4](activites.md#4-ce-que-le-diagramme-a-révélé) (décision du 17/11/2026) |
| RG-34 | Un lecteur n'envoie pas de demande de contact à lui-même | Qui | EX-20 | [Modèle conceptuel des données, § 4](mcd.md#4-vérifications) (décision du 18/11/2026) |
| RG-35 | Quand un compte est supprimé, les groupes qu'il a créés et ses invitations sont supprimés avec lui | Quand | EX-09, EX-12, EX-14, EX-15 | [Modèle conceptuel des données, § 4](mcd.md#4-vérifications) (décision du 18/11/2026) |

## 3. Exigences non fonctionnelles

Une exigence non fonctionnelle s'applique à toute l'application. Les familles sont celles de la norme ISO/IEC 25010.

| ID | Famille | Exigence | Source | Vérification |
| --- | --- | --- | --- | --- |
| ENF-01 | Sécurité | Aucun mot de passe n'est enregistré en clair : seule une empreinte, impossible à inverser, est conservée | [Note de cadrage § 5 (sécurité)](../note-de-cadrage.md#5-exigences-non-fonctionnelles) | Dans les données des comptes, aucune valeur ne permet de relire un mot de passe ; deux comptes créés avec le même mot de passe ont deux empreintes différentes |
| ENF-02 | Sécurité (RGPD) | Données : seuls un pseudonyme et un courriel sont collectés. Finalité : créer le compte, permettre la connexion et informer le lecteur du refus de sa demande de contact (RG-29). Durée : jusqu'à la suppression du compte, automatique après 2 ans sans connexion. Accès : le courriel n'est vu que du lecteur lui-même et de l'administrateur, et n'est transmis qu'au service de courriel, pour cet envoi ; le pseudonyme est vu aussi de ses contacts et des membres de ses groupes | [Note de cadrage § 5 (RGPD)](../note-de-cadrage.md#5-exigences-non-fonctionnelles) | La création de compte ne demande que le pseudonyme, le courriel et le mot de passe ; un compte sans connexion depuis 2 ans est supprimé ; le courriel d'un lecteur ne s'affiche à aucun autre lecteur |
| ENF-03 | Efficacité (performance) | Une page pèse moins de 500 Ko et fait moins de 30 requêtes à son chargement ; une liste affiche au plus 20 livres à la fois ; chaque page s'utilise avec une connexion 3G | [Note de cadrage § 5 (éco-conception)](../note-de-cadrage.md#5-exigences-non-fonctionnelles) · [Accessibilité et éco-conception § 2](accessibilite-eco-conception.md#2-éco-conception) (décision du 18/11/2026) | Bibliothèque ouverte cache vidé, onglet Réseau du navigateur : moins de 500 Ko et moins de 30 requêtes ; avec 25 livres, la première page en affiche 20 et la seconde 5 ; un livre est ajouté avec le navigateur réglé sur 3G |
| ENF-04 | Fiabilité | Aucune erreur technique n'est affichée : en cas de saisie incorrecte ou de panne, un message compréhensible la remplace | [Définition de « terminé », § 3](../definition-of-done.md#3-sécurité-rgpd-et-accessibilité) | Année de publication « abc » saisie, puis base de données arrêtée pendant un ajout : dans les deux cas, un message clair s'affiche, sans texte technique |
| ENF-05 | Utilisabilité (accessibilité) | L'application vise le niveau AA du RGAA 4.1.2 ; l'ajout d'un livre se fait entièrement au clavier | [Note de cadrage § 5 (accessibilité)](../note-de-cadrage.md#5-exigences-non-fonctionnelles) | Un livre est ajouté sans la souris, de l'ouverture de la bibliothèque à l'enregistrement ; les thématiques retenues du RGAA sont contrôlées sur les cinq écrans de l'échantillon |
| ENF-06 | Compatibilité | L'application s'utilise avec la dernière version de Chrome, Firefox, Safari et Edge, et sur un écran à partir de 360 px de large | [Note de cadrage § 5 (compatibilité)](../note-de-cadrage.md#5-exigences-non-fonctionnelles) | L'ajout d'un livre réussit dans les quatre navigateurs ; à 360 px de large, la bibliothèque s'affiche sans défilement horizontal |
| ENF-07 | Maintenabilité | Les tests automatiques couvrent au moins 70 % du code ; les contrôles automatiques de style et de types ne signalent aucune erreur | [Définition de « terminé », § 1](../definition-of-done.md#1-développement-et-qualité-du-code) · [§ 2](../definition-of-done.md#2-tests) | À chaque pull request, le rapport de couverture affiche 70 % ou plus et les contrôles passent sans erreur |
| ENF-08 | Portabilité | L'application et sa base de données démarrent avec une seule commande, sur un poste où seul Docker est installé | [Définition de « terminé », § 5](../definition-of-done.md#5-déploiement-et-infrastructure) | Sur un poste neuf avec Docker, la commande de démarrage lance l'application et crée la base ; la page d'accueil s'ouvre dans le navigateur |

## 4. Matrice de traçabilité

Une ligne par exigence fonctionnelle. Les cas d'utilisation sont ceux de [cas-utilisation.md](cas-utilisation.md) ; les colonnes « Écrans » et « Tables » seront remplies aux fiches 4 et 7.

| Exigence | Objectif | User stories | Cas d'utilisation | Écrans | Tables |
| --- | --- | --- | --- | --- | --- |
| EX-01 | — (prérequis : le compte précède tout) | US-01 | Créer un compte | À venir (fiche 4) | À venir (fiche 7) |
| EX-02 | — (prérequis : le compte précède tout) | US-02 | — (précondition des cas du lecteur et de l'administrateur) | À venir (fiche 4) | À venir (fiche 7) |
| EX-03 | O1 | US-03 | Ajouter un livre | À venir (fiche 4) | À venir (fiche 7) |
| EX-04 | O1 | US-04 | Consulter sa bibliothèque | À venir (fiche 4) | À venir (fiche 7) |
| EX-05 | O1 | US-05 | Changer le statut d'un livre | À venir (fiche 4) | À venir (fiche 7) |
| EX-06 | O2 | US-06 | Écrire ses impressions sur un livre | À venir (fiche 4) | À venir (fiche 7) |
| EX-07 | O2 | US-07 | Retrouver ses impressions sur un livre | À venir (fiche 4) | À venir (fiche 7) |
| EX-08 | O3 | US-08 | Consulter ses statistiques de lecture | À venir (fiche 4) | À venir (fiche 7) |
| EX-09 | — (RGPD : supprimer son compte) | US-09 | Supprimer son compte | À venir (fiche 4) | À venir (fiche 7) |
| EX-10 | O1 | US-10 | Modifier les informations d'un livre | À venir (fiche 4) | À venir (fiche 7) |
| EX-11 | O1 | US-10 | Supprimer un livre | À venir (fiche 4) | À venir (fiche 7) |
| EX-12 | — (périmètre : administration) | US-11 | Supprimer le compte d'un lecteur | À venir (fiche 4) | À venir (fiche 7) |
| EX-13 | — (périmètre : administration) | US-11 | Restaurer un compte supprimé | À venir (fiche 4) | À venir (fiche 7) |
| EX-14 | — (périmètre : groupes) | US-12 | Créer un groupe de lecture | À venir (fiche 4) | À venir (fiche 7) |
| EX-15 | — (périmètre : groupes) | US-13 | Répondre à une invitation | À venir (fiche 4) | À venir (fiche 7) |
| EX-16 | — (périmètre : groupes) | US-20 | — (Could : cas non dessiné) | À venir (fiche 4) | À venir (fiche 7) |
| EX-17 | O2 | US-14 | — (Could : cas non dessiné) | À venir (fiche 4) | À venir (fiche 7) |
| EX-18 | — (périmètre : groupes) | US-15 | — (Could : cas non dessiné) | À venir (fiche 4) | À venir (fiche 7) |
| EX-19 | — (périmètre : groupes) | US-16 | — (Could : cas non dessiné) | À venir (fiche 4) | À venir (fiche 7) |
| EX-20 | — (périmètre : contacts) | US-22 | Envoyer une demande de contact | À venir (fiche 4) | À venir (fiche 7) |
| EX-21 | — (périmètre : contacts) | US-22 | Répondre à une demande de contact | À venir (fiche 4) | À venir (fiche 7) |
| EX-22 | — (périmètre : groupes) | US-23 | Inviter un contact dans son groupe | À venir (fiche 4) | À venir (fiche 7) |
| EX-23 | — (périmètre : vitrine) | US-21 | — (Could : cas non dessiné) | À venir (fiche 4) | À venir (fiche 7) |
| EX-24 | — (périmètre : contacts) | US-22 | Retirer un contact | À venir (fiche 4) | À venir (fiche 7) |
| RG-01 à RG-35 | Celui des exigences qu'elles précisent | Celles de ces exigences | Ceux de ces exigences ; RG-16 : aussi « Effacer les comptes expirés » | À venir (fiche 4) | À venir (fiche 7) |
| ENF-01 à ENF-08 | — (qualité de toute l'application) | Toutes, par la définition de « terminé » | — (tous les cas) ; ENF-02 : aussi « Effacer les comptes expirés » | Tous | À venir (fiche 7) |

## 5. Historique

| Date | Version | Changement |
| --- | --- | --- |
| 16/11/2026 | 0.1 | Création du document : 24 exigences fonctionnelles, 32 règles de gestion, 8 exigences non fonctionnelles, matrice de traçabilité |
| 16/11/2026 | 0.1 | Livre : année de publication, langue d'origine et langue de lecture ; un livre lu en plusieurs langues apparaît une seule fois (EX-03, EX-04, RG-13) |
| 16/11/2026 | 0.1 | Statistiques : par année de lecture, un livre relu compte deux fois ; pas de statistiques par langue (EX-08, RG-11, RG-12, hors périmètre) |
| 16/11/2026 | 0.1 | Recherche par titre ou auteur, filtres sur les autres champs (EX-17) ; note de 1 à 10 au lieu de 0 à 10 (RG-07) |
| 16/11/2026 | 0.1 | Groupes : nom unique, suppression par le créateur, progression en nombre de chapitres (EX-16, EX-19, RG-18, RG-24, RG-25) |
| 16/11/2026 | 0.1 | Ajouts au périmètre : vitrine publique, contacts par code personnel, groupes sur invitation (EX-15 modifiée, EX-20 à EX-24, RG-21, RG-26 à RG-32) |
| 17/11/2026 | 0.2 | Refus d'une demande de contact annoncé par courriel : seconde finalité du courriel, transmis au service de courriel (RG-29, ENF-02) |
| 17/11/2026 | 0.2 | Matrice : colonne « Cas d'utilisation » remplie, 19 cas décrits dans [cas-utilisation.md](cas-utilisation.md) |
| 17/11/2026 | 0.2 | Livre : même titre et même auteur, même livre ; langue de lecture déjà enregistrée refusée ; date de fin enregistrée aussi à l'ajout d'un livre « lu » (RG-06, RG-13) |
| 17/11/2026 | 0.2 | Demandes de contact en attente supprimées avec le compte de leur auteur ou de leur destinataire : règle trouvée par le diagramme d'activité (RG-33) |
| 18/11/2026 | 0.3 | Budget d'une page : 30 requêtes au chargement, cache vidé, connexion 3G ; accessibilité contrôlée sur cinq écrans (ENF-03, ENF-05) : décisions de [accessibilite-eco-conception.md](accessibilite-eco-conception.md) |
| 18/11/2026 | 0.4 | Impressions : une note et un seul texte par livre, pour le ressenti et les citations (EX-06) : décision prise avec le dictionnaire des données de [mcd.md](mcd.md) |
| 18/11/2026 | 0.4 | Livre : le même livre lu dans une autre langue est un autre livre ; une relecture ne compte pas deux fois (EX-04, EX-08, RG-12, RG-13) : décision prise avec le modèle des données |
| 18/11/2026 | 0.4 | Deux règles trouvées par le modèle des données : pas de demande de contact à soi-même, groupes supprimés avec le compte de leur créateur (RG-34, RG-35) |
