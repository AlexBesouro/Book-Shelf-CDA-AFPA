-- Book Shelf: creation script of the database schema (PostgreSQL 18).
-- Design: docs/conception/mld.md. Rule ids (RG, EX, ENF) refer to docs/conception/exigences.md.
--
-- Rerunnable: the schema is dropped and created again, so every run starts from zero.
-- Development only: NEVER run it on a database that holds real data.

DROP SCHEMA IF EXISTS book_shelf CASCADE;
CREATE SCHEMA book_shelf;
SET search_path TO book_shelf;

-- An account: a reader or an administrator.
CREATE TABLE users (
    user_id       bigint GENERATED ALWAYS AS IDENTITY
        CONSTRAINT users_pk PRIMARY KEY,
    username      text NOT NULL
        CONSTRAINT users_username_ck CHECK (btrim(username) <> ''),
    email         varchar(254) NOT NULL,
    -- ENF-01: the password itself is never stored.
    password_hash text NOT NULL,
    role          varchar NOT NULL DEFAULT 'reader'
        CONSTRAINT users_role_ck CHECK (role IN ('reader', 'admin')),
    -- RG-26: a random code, given to another reader to receive a contact request.
    personal_code uuid NOT NULL DEFAULT gen_random_uuid()
        CONSTRAINT users_personal_code_uk UNIQUE,
    -- ENF-02: the account is deleted after 2 years without a login.
    last_login_on date NOT NULL DEFAULT CURRENT_DATE,
    -- RG-16: empty for an active account; filled when an administrator deletes it.
    deleted_on    date
);

-- RG-01: one account per e-mail, whatever the capital letters.
CREATE UNIQUE INDEX users_email_uk ON users (lower(email));

-- A book of one reader's library, with the reader's rating and review.
CREATE TABLE books (
    book_id           bigint GENERATED ALWAYS AS IDENTITY
        CONSTRAINT books_pk PRIMARY KEY,
    -- EX-09, RG-16: the books are erased with the account.
    owner_id          bigint NOT NULL
        CONSTRAINT books_owner_fk REFERENCES users (user_id) ON DELETE CASCADE,
    title             text NOT NULL
        CONSTRAINT books_title_ck CHECK (btrim(title) <> ''),
    author            text NOT NULL
        CONSTRAINT books_author_ck CHECK (btrim(author) <> ''),
    genre             text,
    publication_year  smallint,
    original_language text,
    reading_language  text,
    status            varchar NOT NULL DEFAULT 'to_read'
        CONSTRAINT books_status_ck CHECK (status IN ('to_read', 'reading', 'read')),
    finished_on       date,
    rating            smallint
        CONSTRAINT books_rating_ck CHECK (rating BETWEEN 1 AND 10),
    review            text,
    -- RG-06: a read book has an end date; the others have none.
    CONSTRAINT books_finished_ck CHECK ((status = 'read') = (finished_on IS NOT NULL)),
    -- RG-13: no duplicate in a library; two empty reading languages count as the same.
    CONSTRAINT books_duplicate_uk UNIQUE NULLS NOT DISTINCT (owner_id, title, author, reading_language)
);

-- A reading group. Its members are its creator and the users whose invitation is accepted.
CREATE TABLE groups (
    group_id          bigint GENERATED ALWAYS AS IDENTITY
        CONSTRAINT groups_pk PRIMARY KEY,
    -- RG-35: the groups are deleted with their creator.
    creator_id        bigint NOT NULL
        CONSTRAINT groups_creator_fk REFERENCES users (user_id) ON DELETE CASCADE,
    -- RG-18: two groups never have the same name.
    group_name        text NOT NULL
        CONSTRAINT groups_name_ck CHECK (btrim(group_name) <> '')
        CONSTRAINT groups_name_uk UNIQUE,
    group_description text
);

-- A contact request from one reader to another. An accepted request is a contact (RG-28).
CREATE TABLE contact_requests (
    contact_request_id     bigint GENERATED ALWAYS AS IDENTITY
        CONSTRAINT contact_requests_pk PRIMARY KEY,
    -- RG-33, EX-09: the requests and the contacts go with the account.
    sender_id              bigint NOT NULL
        CONSTRAINT contact_requests_sender_fk REFERENCES users (user_id) ON DELETE CASCADE,
    recipient_id           bigint NOT NULL
        CONSTRAINT contact_requests_recipient_fk REFERENCES users (user_id) ON DELETE CASCADE,
    contact_request_status varchar NOT NULL DEFAULT 'pending'
        CONSTRAINT contact_requests_status_ck
        CHECK (contact_request_status IN ('pending', 'accepted', 'refused')),
    -- RG-34: nobody sends a request to oneself.
    CONSTRAINT contact_requests_not_self_ck CHECK (sender_id <> recipient_id)
);

-- RG-29 (in part): one pending or accepted request from a sender to a recipient;
-- after a refusal, a new request is allowed.
CREATE UNIQUE INDEX contact_requests_active_uk ON contact_requests (sender_id, recipient_id)
    WHERE contact_request_status <> 'refused';

-- An invitation of a user to a group (association INVITE of the MCD).
CREATE TABLE group_invitations (
    -- RG-35: an invitation is deleted with its group, and with its user.
    group_id                bigint
        CONSTRAINT group_invitations_group_fk REFERENCES groups (group_id) ON DELETE CASCADE,
    user_id                 bigint
        CONSTRAINT group_invitations_user_fk REFERENCES users (user_id) ON DELETE CASCADE,
    group_invitation_status varchar NOT NULL DEFAULT 'pending'
        CONSTRAINT group_invitations_status_ck
        CHECK (group_invitation_status IN ('pending', 'accepted', 'refused')),
    -- RG-20: one invitation per user and per group.
    CONSTRAINT group_invitations_pk PRIMARY KEY (group_id, user_id)
);
