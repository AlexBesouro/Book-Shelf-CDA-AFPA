-- Book Shelf: statements that the database must refuse (PostgreSQL 18).
-- Run it after schema.sql and jeu-essai.sql, WITHOUT ON_ERROR_STOP: psql shows each error and goes on.
-- Every statement must end with ERROR; the last query shows that nothing was stored.

SET search_path TO book_shelf;

-- Expected: users_email_uk. The same e-mail with capital letters is the same account (RG-01).
INSERT INTO users (username, email, password_hash) VALUES ('lea2', 'LEA@example.test', 'fake-hash');

-- Expected: an identity column refuses a value chosen by hand.
INSERT INTO users (user_id, username, email, password_hash)
VALUES (50, 'zoe', 'zoe@example.test', 'fake-hash');

-- Expected: not-null constraint on author. A book always has an author (RG-36).
INSERT INTO books (owner_id, title) VALUES (1, 'Germinal');

-- Expected: books_status_ck. The status is one of three values (RG-05).
INSERT INTO books (owner_id, title, author, status) VALUES (1, 'Germinal', 'Émile Zola', 'abandoned');

-- Expected: books_rating_ck. A rating goes from 1 to 10 (RG-07).
INSERT INTO books (owner_id, title, author, rating) VALUES (1, 'Germinal', 'Émile Zola', 15);

-- Expected: books_finished_ck. A read book has an end date (RG-06).
INSERT INTO books (owner_id, title, author, status) VALUES (1, 'Germinal', 'Émile Zola', 'read');

-- Expected: books_duplicate_uk. Same owner, title, author and reading language (RG-13).
INSERT INTO books (owner_id, title, author, reading_language)
VALUES (1, 'La Peste', 'Albert Camus', 'français');

-- Expected: books_owner_fk. No account has the identifier 999 (RG-14).
INSERT INTO books (owner_id, title, author) VALUES (999, 'Germinal', 'Émile Zola');

-- Expected: contact_requests_not_self_ck. Nobody sends a request to oneself (RG-34).
INSERT INTO contact_requests (sender_id, recipient_id) VALUES (1, 1);

-- Expected: contact_requests_active_uk. marie33 already has a pending request to lea (RG-29).
INSERT INTO contact_requests (sender_id, recipient_id) VALUES (3, 1);

-- Expected: groups_name_uk. Two groups never have the same name (RG-18).
INSERT INTO groups (creator_id, group_name) VALUES (2, 'Classiques');

-- Expected: group_invitations_pk. One invitation per user and per group (RG-20).
INSERT INTO group_invitations (group_id, user_id) VALUES (1, 2);

-- Nothing above was stored. Expected: 5 users, 7 books, 3 contact requests, 1 group, 1 invitation.
SELECT
    (SELECT count(*) FROM users) AS users,
    (SELECT count(*) FROM books) AS books,
    (SELECT count(*) FROM contact_requests) AS contact_requests,
    (SELECT count(*) FROM groups) AS groups,
    (SELECT count(*) FROM group_invitations) AS group_invitations;
