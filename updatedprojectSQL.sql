-- using remotemysql.com free server to run and test this code. 
use  tvqpe6wmuq; -- must do this otherwise the remote db will fail!

create table Reviewers(rid int, fname text, lname text, pass text, email text, affilation text, primary key(rid)); -- added the alter
show tables;

create table Reviews(revID int, rating int,comment text, primary key(revID), check(rating >= 1 or rating <= 5)); -- done

create table writes(rid int, revID int , affilate text, primary key(rid,revID), foreign key(rid) 
references Reviewers(rid) on delete cascade, foreign key(revID) references Reviews(revID) on delete cascade);

-- bottom half of ER-Diagram 
create table videogame(vid int, title text, publisher text, platform text, developer text, photopath text, 
coverjpg longblob, primary key(vid));

create table recieves(vid int, revID int, creationDate date, primary key(vid, revID),
foreign key(vid) references videogame(vid) on delete cascade, foreign key(revID) references Reviews(revID) on delete cascade);

create table category(cid int, categoryName text, primary key(cid));


create table belongsTo(vid int, cid int, categoryName text, primary key(vid,cid), foreign key(vid) references videogame(vid) 
on delete cascade, foreign key(cid) references category(cid) on delete cascade);

show tables; -- all syntax correct.

insert into videogame(vid, title, publisher, platform, developer, photopath, coverjpg)
values(1,'super mario sunshine', 'Nintendo', 'gamecube', 'nintendo', 'n/a', load_file('mario.jpg'));

select * from videogame where title  = 'super mario sunshine';
-- unable to drop tables unless you drop the relationship table first.
drop table Reviewers;
drop table Reviews;
drop table writes; -- del first
drop table videogame;
drop table recieves; -- del first

