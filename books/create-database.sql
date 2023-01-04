DROP TABLE IF EXISTS author;
DROP TABLE IF EXISTS book;

CREATE TABLE author(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name text NOT NULL
);

CREATE TABLE book(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    author_id INTEGER NOT NULL,
    title text NOT NULL,
    FOREIGN KEY(author_id) REFERENCES author(id)
);

INSERT INTO author(name)
VALUES("Charles Dickens"),
      ("Herbert George Wells"),
      ("Jules Verne"),
      ("Arthur Conan Doyle");

INSERT INTO book(author_id, title)
VALUES(1, "Oliver Twist"),
      (1, "A Christmas Carol"),
      (1, "David Copperfield"),
      (1, "Great Expectations");

INSERT INTO book(author_id, title)
VALUES(2, "The War of the Worlds"),
      (2, "The Time Machine"),
      (2, "The Island of Doctor Moreau"),
      (2, "The Invisible Man: A Grotesque Romance");

INSERT INTO book(author_id, title)
VALUES(3, "Around the World in Eighty Days"),
      (3, "Twenty Thousand Leagues under the Sea"),
      (3, "A Journey to the Centre of the Earth"),
      (3, "The Mysterious Island");

INSERT INTO book(author_id, title)
VALUES(4, "The Adventures of Sherlock Holmes"),
      (4, "The Hound of the Baskervilles"),
      (4, "A Study in Scarlet"),
      (4, "The Sign of Four"),
      (4, "The Memoirs of Sherlock Holmes"),
      (4, "The Lost World"),
      (4, "The Return of Sherlock Holmes"),
      (4, "The Valley of Fear"),
      (4, "His Last Bow: An Epilogue of Sherlock Holmes");
