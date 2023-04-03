drop table if exists authors;
drop table if exists publishers;
drop table if exists genres;
drop table if exists bookshops;
drop table if exists books;
drop table if exists sales;

create table authors(
  id integer primary key autoincrement,
  name text not null
);

create table publishers(
  id integer primary key autoincrement,
  name text not null
);

create table genres(
  id integer primary key autoincrement,
  name text not null
);

create table bookshops(
  id integer primary key autoincrement,
  name text not null,
  location text not null
);

create table books(
  id integer primary key autoincrement,
  title text not null,
  price float not null,
  author_id integer not null,
  publisher_id integer not null,
  genre_id integer not null,
  foreign key(author_id) references authors(id),
  foreign key(publisher_id) references publishers(id),
  foreign key(genre_id) references genres(id)
);

create table sales(
  id integer primary key autoincrement,
  sale_date date not null,
  quantity integer not null,
  book_id integer not null,
  bookshop_id integer not null,
  foreign key(book_id) references books(id),
  foreign key(bookshop_id) references bookshops(id)
);

insert into authors(name)
values
  ("Rico Haley"),                                                                     
  ("Isabell Ward"),                                                                   
  ("Mariano Rippin"),                                                                 
  ("Winston Hyatt"),                                                                  
  ("Sal Bogan")
;

insert into publishers(name)
values
  ("Bloomsbury Publishing Plc"),
  ("Parragon"),                                                                       
  ("Candlewick Press"),                                                               
  ("New Village Press")
;

insert into genres(name)
values
  ("Horror"),                                                                         
  ("Biography/Autobiography"),                                                        
  ("Fiction")
;                                                           

insert into bookshops(name, location)
values
  ("Keel Row Bookshop", "North Shields"),
  ("Olivers Bookshop", "Whitley Bay"),
  ("Forum Books", "Corbridge"),
  ("Book Corner", "Saltburn-by-the-Sea"),
  ("Waterstones", "Newcastle upon Tyne"),
  ("Drake The Bookshop", "Stockton-on-Tees"),
  ("Cogito Books", "Hexham"),
  ("Blackwell's Book Shop", "Newcastle upon Tyne"),
  ("Waterstones", "Gateshead"),
  ("Waterstones", "Durham"),
  ("Lehmanns", "Gateshead"),
  ("Waterstones", "Morpeth"),
  ("Barter Books", "Alnwick"),
  ("People's Bookshop", "Durham"),
  ("Bookwyrm", "Durham"),
  ("The Accidental Bookshop", "Alnwick"),
  ("Seven Stories", "Newcastle upon Tyne")
;

insert into books(title, price, author_id, publisher_id, genre_id)
values
  ("The Skull Beneath the Skin", 17.14, 1, 2, 1),
  ("Carrion Comfort", 6.78, 4, 2, 1),                                                                                                                          
  ("Everything is Illuminated", 21.58, 1, 4, 1),                                                                                                               
  ("Such, Such Were the Joys", 12.89, 2, 3, 2),
  ("If I Forget Thee Jerusalem", 15.56, 2, 3, 2),                                                                                                              
  ("Oh! To be in England", 13.22, 3, 4, 2),                                                                                                                                                          
  ("Paths of Glory", 6.39, 5, 1, 3),                                                                                                                           
  ("The Widening Gyre", 12.36, 5, 1, 3),                                                                                                                       
  ("After Many a Summer Dies the Swan", 7.34, 4, 3, 3),                                                                                                        
  ("The Wives of Bath", 5.97, 3, 1, 3)                                                                                                                        
;
