
drop database animal
CREATE DATABASE animal
GO

USE animal
--GO
-- drop table Bill
--  drop table animalInfo
-- drop table billDetail
-- drop table Users

CREATE TABLE animalInfo(
	Did int PRIMARY KEY,
	type nvarchar(150) NOT NULL,
	gender char NOT NULL,
	dateOfBirth date NOT NULL,
	
	weight float,
	price int NOT NULL,
	description nvarchar(300) ,
	imgPath varchar(100),
	sold bit not null
 )
  CREATE TABLE Users(

name nvarchar(150) primary key,
email nvarchar(150),
password nvarchar(100),
role int not null
)
GO
CREATE TABLE Bill(
Bid int NOT NULL identity(1,1),
totalValue int,
Uname nvarchar(150) NOT NULL foreign key references Users(name),
primary key (Bid)
)


CREATE TABLE billDetail(
 Bid int  foreign key references Bill(Bid) ,
 Did int foreign key references animalInfo(Did),

 )


create table kart(
 uname nvarchar(150) NOT NULL foreign key references Users(name),
 Did int  NOT NULL foreign key references animalinfo(Did)
 primary key(uname, did)
 )


select max(price) from animalInfo

INSERT INTO animalInfo(Did, type, gender, dateOfBirth,weight,price,description,imgPath,sold) VALUES (1,'hamster','f','2020-1-12',0.2,30,'fat, yellow, more hair','img/1.jpg',0)
INSERT INTO animalInfo(Did, type, gender, dateOfBirth,weight,price,description,imgPath,sold) VALUES (11,'hamster','m','2021-4-6',0.15,15,'white, yellow, less hair','img/11.jpg',0)
INSERT INTO animalInfo(Did, type, gender, dateOfBirth,weight,price,description,imgPath,sold) VALUES (3,'hamster','m','2021-2-23',0.17,22,'pale yellow, moderate hair','img/3.jpg',0)
INSERT INTO animalInfo(Did, type, gender, dateOfBirth,weight,price,description,imgPath,sold) VALUES (13,'hamster','f','2019-9-5',0.22,42,'fat, white, big nose','img/13.jpg',0)
INSERT INTO animalInfo(Did, type, gender, dateOfBirth,weight,price,description,imgPath,sold) VALUES (5,'hamster','m','2020-4-24',0.16,100,'yellow, moderate hair','img/5.jpg',0)
INSERT INTO animalInfo(Did, type, gender, dateOfBirth,weight,price,description,imgPath,sold) VALUES (15,'hamster','f','2019-11-19',0.19,20,'yellow, more hair','img/15.jpg',0)
INSERT INTO animalInfo(Did, type, gender, dateOfBirth,weight,price,description,imgPath,sold) VALUES (7,'hamster','m','2021-2-2',0.17,100,'white, big mouth','img/7.jpg',0)
INSERT INTO animalInfo(Did, type, gender, dateOfBirth,weight,price,description,imgPath,sold) VALUES (17,'hamster','m','2020-6-17',0.2,100,'white, black, more hair','img/17.jpg',0)
INSERT INTO animalInfo(Did, type, gender, dateOfBirth,weight,price,description,imgPath,sold) VALUES (9,'hamster','f','2020-10-8',0.19,17,'yellow, big mouth','img/9.jpg',0)
INSERT INTO animalInfo(Did, type, gender, dateOfBirth,weight,price,description,imgPath,sold) VALUES (19,'hamster','m','2019-7-7',0.21,30,'white, yellow, black right eye','img/19.jpg',0)
INSERT INTO animalInfo(Did, type, gender, dateOfBirth,weight,price,description,imgPath,sold) VALUES (2,'cat','m','2018-2-3',5.1,25,'white, more whisker, black eye','img/2.jpg',0)
INSERT INTO animalInfo(Did, type, gender, dateOfBirth,weight,price,description,imgPath,sold) VALUES (12,'cat','f','2019-9-27',4.7,40,'very white, yellow eye','img/12.jpg',0)
INSERT INTO animalInfo(Did, type, gender, dateOfBirth,weight,price,description,imgPath,sold) VALUES (4,'cat','m','2017-3-22',6,30,'fat, white, yellow eye','img/4.jpg',0)
INSERT INTO animalInfo(Did, type, gender, dateOfBirth,weight,price,description,imgPath,sold) VALUES (14,'cat','m','2020-2-5',3.9,37,'white, yellow ear, white eye','img/14.jpg',0)
INSERT INTO animalInfo(Did, type, gender, dateOfBirth,weight,price,description,imgPath,sold) VALUES (6,'cat','f','2019-7-31',5.8,34,'fat, dark, long whisker','img/6.jpg',0)
INSERT INTO animalInfo(Did, type, gender, dateOfBirth,weight,price,description,imgPath,sold) VALUES (16,'cat','m','2019-11-12',4.2,85,'white, black ear, 2-colored eye','img/16.jpg',0)
INSERT INTO animalInfo(Did, type, gender, dateOfBirth,weight,price,description,imgPath,sold) VALUES (8,'cat','m','2020-1-4',3.2,18,'white, long whisker, yellow eye','img/8.jpg',0)
INSERT INTO animalInfo(Did, type, gender, dateOfBirth,weight,price,description,imgPath,sold) VALUES (18,'cat','m','2017-6-6',8.9,55,'very tall, white, yellow eye','img/18.jpg',0)
INSERT INTO animalInfo(Did, type, gender, dateOfBirth,weight,price,description,imgPath,sold) VALUES (10,'cat','f','2020-5-17',2.9,21,'white, stripe','img/10.jpg',0)
INSERT INTO animalInfo(Did, type, gender, dateOfBirth,weight,price,description,imgPath,sold) VALUES (20,'cat','f','2021-8-6',1.8,18,'very white, small','img/20.jpg',0)

INSERT INTO animalInfo(Did, type, gender, dateOfBirth,weight,price,description,imgPath,sold) VALUES (21,'dog','m','2020-1-26',30,20,'Golden Retriever, Golden fur, easy to train and get along, great with kids and very protective of their humans','img/21.jpg',0)
INSERT INTO animalInfo(Did, type, gender, dateOfBirth,weight,price,description,imgPath,sold) VALUES (31,'dog','m','2021-3-31',23,35,'Shiba Inu, double coated with the outer coat being stiff and straight and the undercoat soft and thick, Golden fur, Fur is short and even on the foxlike face, ears, and legs.','img/31.jpg',0)
INSERT INTO animalInfo(Did, type, gender, dateOfBirth,weight,price,description,imgPath,sold) VALUES (23,'dog','f','2021-7-12',14,25,'French Bulldog, these cuties are one of the sweetest black dog breeds: Friendly and relaxed, with big bat ears that are endlessly endearing. Their smooth coats and adorable wrinkles compliment their fun-loving natures.','img/23.jpg',0)
INSERT INTO animalInfo(Did, type, gender, dateOfBirth,weight,price,description,imgPath,sold) VALUES (33,'dog','m','2020-8-29',20,60,'Siberian Husky, a thickly coated, compact sled dog of medium size and great endurance','img/33.jpg',0)
INSERT INTO animalInfo(Did, type, gender, dateOfBirth,weight,price,description,imgPath,sold) VALUES (25,'dog','f','2019-4-1',70,24,'Broholmer, fat, powerful with a loud, impressive bark and dominant walk. Good tempered, and friendly, yet watchful towards strangers','img/25.jpg',0)
INSERT INTO animalInfo(Did, type, gender, dateOfBirth,weight,price,description,imgPath,sold) VALUES (35,'dog','f','2020-7-19',16,15,'French Bulldog, large bat ear, the head is large and square, with heavy wrinkles rolled above the extremely short nose','img/35.jpg',0)
INSERT INTO animalInfo(Did, type, gender, dateOfBirth,weight,price,description,imgPath,sold) VALUES (27,'dog','m','2022-12-26',15,20,'French Bulldog, small, golden fur, friendly ','img/27.jpg',0)
INSERT INTO animalInfo(Did, type, gender, dateOfBirth,weight,price,description,imgPath,sold) VALUES (37,'dog','m','2022-10-1',30,80,'Labrador Husky, white and black fur, black eyes. The Labrador Husky has a fantastic work ethic and socializes well with other dogs. Colder climates suit them best, but they are adaptable','img/37.jpg',0)
INSERT INTO animalInfo(Did, type, gender, dateOfBirth,weight,price,description,imgPath,sold) VALUES (29,'dog','m','2021-2-22',28,50,'Bavarian Mountain Hound, brown fur, brown eyes, courageous, calm, loyal, devoted and determined','img/29.jpg',0)
INSERT INTO animalInfo(Did, type, gender, dateOfBirth,weight,price,description,imgPath,sold) VALUES (39,'dog','m','2022-12-10',6,48,'Petit Brabancon, short black fur, small, triangle ear','img/39.jpg',0)
INSERT INTO animalInfo(Did, type, gender, dateOfBirth,weight,price,description,imgPath,sold) VALUES (22,'bird','m','2020-6-1',2,70,'Oriental magpie-robin, a medium-sized robin (19-20 cm) with a broad white wing-bar running from the shoulder to the tip of the wing, and a long tail with white outer-tail feathers','img/22.jpg',0)
INSERT INTO animalInfo(Did, type, gender, dateOfBirth,weight,price,description,imgPath,sold) VALUES (32,'bird','m','2021-2-8',3,80,'Nightingale, a very small bird with a beautiful, loud song. If you hear the distinctive whistles of the nightingale, it is most likely a male bird seeking a mate','img/32.jpg',0)
INSERT INTO animalInfo(Did, type, gender, dateOfBirth,weight,price,description,imgPath,sold) VALUES (24,'bird','f','2022-5-23',2,40,'Orioles, medium-sized, sturdy-bodied songbird with a thick neck, long legs, and pointed bill','img/24.jpg',0)
INSERT INTO animalInfo(Did, type, gender, dateOfBirth,weight,price,description,imgPath,sold) VALUES (34,'bird','m','2022-9-2',2,60,'Jungle babbler, this familiar ash-brown colored babbler has a yellow bill and a dark brow in front of the eye that contrasts with its pale eye giving it a perpetual “angry” look','img/34.jpg',0)
INSERT INTO animalInfo(Did, type, gender, dateOfBirth,weight,price,description,imgPath,sold) VALUES (26,'bird','f','2022-7-22',1,70,'Red-whiskered, white belly and breast and a dark brown to black collar extending down each shoulder. The long tail has white tips, and the bird has a pointed black beak. The long (2cm) crest is held upright except when the bird is flying','img/26.jpg',0)
INSERT INTO animalInfo(Did, type, gender, dateOfBirth,weight,price,description,imgPath,sold) VALUES (36,'fish','m','2022-3-2',1,25,'Koi Fish, their bodies generally grow quite large, many have long flowing fins, and most have colorful bodies','img/36.jpg',0)
INSERT INTO animalInfo(Did, type, gender, dateOfBirth,weight,price,description,imgPath,sold) VALUES (28,'fish','m','2022-4-4',1,50,'Croaking gourami, a compact oval fish with a long filamentous ray extending from each pelvic fin','img/28.jpg',0)
INSERT INTO animalInfo(Did, type, gender, dateOfBirth,weight,price,description,imgPath,sold) VALUES (38,'fish','m','2022-2-7',1,20,'Geophagus surinamensis, one of the larger Geophagus, getting around 12 inches when fully grown. It is known for its bright blue and red striping. They often roam around the tank sifting through the substrate for food, hence how they get their name Geophagus','img/38.jpg',0)
INSERT INTO animalInfo(Did, type, gender, dateOfBirth,weight,price,description,imgPath,sold) VALUES (30,'fish','m','2022-9-29',1,29,'Discus, its body is very compressed on the sides, it has a disk-shaped profile and its fins are large and elegant','img/30.jpg',0)
INSERT INTO animalInfo(Did, type, gender, dateOfBirth,weight,price,description,imgPath,sold) VALUES (40,'fish','m','2022-10-22',1,55,'Pterophyllum altum, the species is the largest member in its genus and specimens may have a height (from tip of dorsal to tip of anal fin) of as much as 38 cm. Its natural base color is silver but with three brownish/red vertical stripes and red striations into the fins','img/40.jpg',0)




--select * from Users
insert into Users(name,email,password,role) values ('chu1','asd','asdasd',1)
insert into Users(name,email,password,role) values ('chu2','acs','asdasd',2)

insert into Users(name,email,password,role) values ('chu3','asdfgd','asdasd',2)
insert into Users(name,email,password,role) values ('chu4','asdfgd','asdasd',2)
insert into Users(name,email,password,role) values ('dung','dddd','1234',2)


--select * from billDetail

--select * from Bill
insert into  Bill(Uname) values ('chu1')
insert into  Bill(Uname) values ('chu2')
insert into  Bill(Uname) values ('chu3')
insert into  Bill(Uname) values ('chu3')
insert into  Bill(Uname) values ('chu4')



insert into billDetail(Bid,Did) values (1,2)
insert into billDetail(Bid,Did) values (2,3)
insert into billDetail(Bid,Did) values (3,4)
insert into billDetail(Bid,Did) values (4,5)
insert into billDetail(Bid,Did) values (5,6)


--delete from billDetail
--delete from Bill
--delete from animalInfo
--delete from kart