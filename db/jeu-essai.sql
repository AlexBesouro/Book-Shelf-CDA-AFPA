-- Book Shelf: minimal test data (PostgreSQL 18).
-- Run it right after schema.sql, on empty tables: the identifiers then start at 1.
-- Everything is fictive: reserved e-mail domain (example.test), fake password hashes.

SET search_path TO book_shelf;

-- Accounts. The database gives the identifiers: 1 = lea, 2 = omar, 3 = marie33, 4 = paul, 5 = admin.
-- Nothing is given for role, personal_code and last_login_on: the default values are used.
INSERT INTO users (username, email, password_hash) VALUES
    ('lea', 'lea@example.test', 'fake-hash'),
    ('omar', 'omar@example.test', 'fake-hash'),
    ('marie33', 'marie33@example.test', 'fake-hash');

-- An account deleted by the administrator 40 days ago: past the 30 days of RG-16.
INSERT INTO users (username, email, password_hash, deleted_on) VALUES
    ('paul', 'paul@example.test', 'fake-hash', CURRENT_DATE - 40);

INSERT INTO users (username, email, password_hash, role) VALUES
    ('admin', 'admin@example.test', 'fake-hash', 'admin');

-- Books of lea (1). The same title in another reading language is another book (RG-13).
-- The last book is given no status: the database writes 'to_read' (RG-05).
INSERT INTO books
    (owner_id, title, author, genre, publication_year, original_language, reading_language,
     status, finished_on, rating, review)
VALUES
    (1, 'L''Étranger', 'Albert Camus', 'roman', 1942, 'français', 'français',
     'read', '2025-03-12', 8, 'Un style sec et direct. « Aujourd''hui, maman est morte. »'),
    (1, 'L''Étranger', 'Albert Camus', 'roman', 1942, 'français', 'anglais',
     'read', '2026-01-20', 7, NULL),
    (1, 'La Peste', 'Albert Camus', 'roman', 1947, 'français', 'français',
     'read', '2026-02-15', 9, NULL),
    (1, 'Dune', 'Frank Herbert', 'science-fiction', 1965, 'anglais', 'français',
     'read', '2026-05-02', NULL, NULL),
    (1, 'Les Misérables', 'Victor Hugo', 'roman', 1862, 'français', 'français',
     'reading', NULL, NULL, NULL),
    (1, '1984', 'George Orwell', 'roman', 1949, 'anglais', NULL,
     DEFAULT, NULL, NULL, NULL);

-- A book of omar (2): the same book can be in two libraries.
INSERT INTO books (owner_id, title, author, status, finished_on) VALUES
    (2, 'Dune', 'Frank Herbert', 'read', '2026-03-01');

-- Contact requests. omar and lea are contacts (RG-28).
-- marie33 was refused once, then asked again: allowed after a refusal (RG-29).
INSERT INTO contact_requests (sender_id, recipient_id, contact_request_status) VALUES
    (2, 1, 'accepted'),
    (3, 1, 'refused');

INSERT INTO contact_requests (sender_id, recipient_id) VALUES
    (3, 1);

-- A group created by lea (1); omar (2), one of her contacts, accepted her invitation.
INSERT INTO groups (creator_id, group_name, group_description) VALUES
    (1, 'Classiques', 'Lire un classique par mois');

INSERT INTO group_invitations (group_id, user_id, group_invitation_status) VALUES
    (1, 2, 'accepted');

-- Check 1: books read by lea, per year of reading (RG-10, RG-11, RG-12).
-- Expected: 2026 = 3, 2025 = 1.
SELECT extract(year FROM finished_on) AS reading_year, count(*) AS books_read
FROM books
WHERE owner_id = 1 AND status = 'read'
GROUP BY reading_year
ORDER BY reading_year DESC;

-- Check 2: members of the group 'Classiques': its creator and the accepted invitations (RG-19, RG-21).
-- Expected: lea (creator), omar (invited).
SELECT u.username, 'creator' AS member_role
FROM groups g
JOIN users u ON u.user_id = g.creator_id
WHERE g.group_name = 'Classiques'
UNION ALL
SELECT u.username, 'invited'
FROM groups g
JOIN group_invitations i ON i.group_id = g.group_id
JOIN users u ON u.user_id = i.user_id
WHERE g.group_name = 'Classiques' AND i.group_invitation_status = 'accepted'
ORDER BY member_role, username;

-- Check 3: accounts to erase today: deleted more than 30 days ago (RG-16).
-- Expected: paul.
SELECT username, deleted_on + 30 AS erase_on
FROM users
WHERE deleted_on + 30 <= CURRENT_DATE;
