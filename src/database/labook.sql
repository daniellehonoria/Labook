-- Active: 1676323343806@@127.0.0.1@3306
CREATE TABLE users (
    id TEXT NOT NULL UNIQUE PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    password TEXT NOT NULL,
    role TEXT,
    created_at TEXT DEFAULT (DATETIME()) NOT NULL
);

INSERT INTO users (id, name, email, password)
VALUES
("u001", "Andressa Fernandes", "andressa@mail.com", "andressa14"),
("u002", "Gabriel Boer", "biel@mail.com", "biel11"),
("u003", "Wellington Fernandes", "well@mail.com","well91" ),
("u004", "Antonio Pereira", "antonio@mail.com", "antonio65"),
("u005", "Sonia Maria", "sonia@mail.com", "sonia07");

CREATE TABLE posts (
    id TEXT NOT NULL UNIQUE PRIMARY KEY,
    creator_id TEXT NOT NULL,
    content TEXT,
    likes INTEGER DEFAULT(0),
    dislikes INTEGER DEFAULT(0),
    created_at TEXT DEFAULT (DATETIME()),
    updated_at TEXT DEFAULT (DATETIME()),
    FOREIGN KEY (creator_id) REFERENCES users (id)
);
DROP TABLE posts;
INSERT INTO posts(id, creator_id, content)
VALUES
("p001", "u001", "Meu primeiro post no labook"),
("p002", "u004", "Ano novo vida nova"),
("p003", "u001", "Partiu bloquinho"),
("p004", "u002", "É preciso amar as pessoas como se não houvesse amanhã"),
("p005", "u005", "A vida é tão rara");

CREATE TABLE likes_deslikes(
    user_id TEXT NOT NULL,
    post_id TEXT NOT NULL,
    like INTEGER DEFAULT(0),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (post_id) REFERENCES posts (id)
);