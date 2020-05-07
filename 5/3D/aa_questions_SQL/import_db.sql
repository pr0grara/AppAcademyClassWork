PRAGMA foreign_keys = ON;


DROP TABLE IF EXISTS users;
CREATE TABLE users(
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

DROP TABLE IF EXISTS questions;
CREATE TABLE questions(
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS questions_follows;
CREATE TABLE questions_follows(
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

DROP TABLE IF EXISTS replies;
CREATE TABLE replies(
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    parent_reply_id INTEGER,
    body_reply TEXT NOT NULL,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS question_likes;
CREATE TABLE question_likes(
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
    users (fname, lname)
VALUES
    ('Julie', 'Bock'),
    ('Ara', 'Baghdassarian'),
    ('Alvin', 'Zablan');


INSERT INTO
    questions (title, body, user_id)
VALUES
    ('banana', 'banana?',(SELECT id FROM users WHERE fname LIKE 'Julie'));

INSERT INTO
    questions_follows (question_id, user_id)
VALUES
    ((SELECT id FROM questions WHERE title LIKE 'banana'), (SELECT id FROM users WHERE fname LIKE 'Ara'));

INSERT INTO
    replies (question_id, parent_reply_id, body_reply, user_id)
VALUES
    ((SELECT id FROM questions WHERE title LIKE 'banana'), NULL, 'no, apple!', (SELECT id FROM users WHERE fname LIKE 'Alvin')),
    ((SELECT id FROM questions WHERE title LIKE 'banana'), 1,'applesauce?', (SELECT id FROM users WHERE fname LIKE 'Julie'));


-- (SELECT id FROM replies WHERE body_reply LIKE 'no, apple!')

-- #questions_follows.user_id
-- #users.id
-- #questions.user_id
-- #replies.user_id

-- CREATE TABLE plays(
--     id INTEGER PRIMARY KEY,
--     title TEXT NOT NULL,
--     year INTEGER NOT NULL,
--     playwright_id INTEGER NOT NULL,

--     FOREIGN KEY (playwright_id) REFERENCES playwrights(id)
-- );

-- DROP TABLE if exists playwrights;

-- CREATE TABLE playwrights
-- (
--     id INTEGER PRIMARY KEY,
--     name TEXT NOT NULL,
--     birth_year INTEGER
-- );