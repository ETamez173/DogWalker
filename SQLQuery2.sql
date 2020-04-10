

CREATE Table Neighborhood (
  Id INTEGER NOT NULL PRIMARY KEY IDENTITY,
  [Name] VARCHAR(55) NOT NULL
)

CREATE Table [Owner] (
  Id INTEGER NOT NULL PRIMARY KEY IDENTITY,
 [Name] VARCHAR(55) NOT NULL,
  Address VARCHAR(255)  NOT NULL,
  NeighborhoodId INTEGER  NOT NULL,
  Phone VARCHAR(55)  NOT NULL,
 CONSTRAINT FK_Owner_Neighborhood FOREIGN KEY(NeighborhoodId) REFERENCES Neighborhood(Id)
)

CREATE Table Walker (
  Id INTEGER NOT NULL PRIMARY KEY IDENTITY,
 [Name] VARCHAR(55) NOT NULL,
  NeighborhoodId INTEGER  NOT NULL,
  CONSTRAINT FK_Walker_Neighborhood FOREIGN KEY(NeighborhoodId) REFERENCES Neighborhood(Id),
)




CREATE TABLE Dog (
	Id INTEGER NOT NULL PRIMARY KEY IDENTITY,
	[Name] VARCHAR(55) NOT NULL,
	OwnerId INTEGER NOT NULL,
	Breed VARCHAR(55) NOT NULL,
	Notes VARCHAR(255),
	CONSTRAINT FK_Dog_Owner FOREIGN KEY (OwnerId) REFERENCES [Owner](Id)
);

CREATE Table Walks (
    Id INTEGER NOT NULL PRIMARY KEY IDENTITY,
    [Date] DATETIME NOT NULL,
    Duration INTEGER NOT NULL,
    WalkerId INTEGER,
    DogId INTEGER,
    CONSTRAINT FK_Walks_Walker FOREIGN KEY(WalkerId) REFERENCES Walker(Id),
    CONSTRAINT FK_Walks_Dog FOREIGN KEY(DogId) REFERENCES Dog(Id)
)



--Populate each table with data. You should have 
--2-3 neighborhoods, 5-10 dogs, 4-8 owners, 2-5 walkers 
--and each walker should have 1-2 walks recorded.

--2-3 neighborhoods is DONE
INSERT INTO Neighborhood (Name) VALUES ('Victory Point');
INSERT INTO Neighborhood (Name) VALUES ('DownTown');
INSERT INTO Neighborhood (Name) VALUES ('NiceVille');

--4-8 owners is DONE
  
INSERT INTO Owner ([Name], Address, NeighborhoodId, Phone) VALUES ('Maura', '123 Main Street', 1, '615-555-1212');
INSERT INTO Owner ([Name], Address, NeighborhoodId, Phone) VALUES ('Catherine', '123 Main Street', 1, '615-555-7777');
INSERT INTO Owner ([Name], Address, NeighborhoodId, Phone) VALUES ('Joe Jones', '500 Adams Street', 2,'303-922-5555');
INSERT INTO Owner ([Name], Address, NeighborhoodId, Phone) VALUES ('Sam Smith', '15 Jackson Street', 3, '212-333-6432');


  --2-5 walkers is DONE

INSERT INTO Walker (Name, NeighborhoodId) VALUES ('Sue Puppieas', 1);
INSERT INTO Walker (Name, NeighborhoodId) VALUES ('Jim Coles',1);
INSERT INTO Walker (Name, NeighborhoodId) VALUES ('Noah Biggs',2);
INSERT INTO Walker (Name, NeighborhoodId) VALUES ('Jane Short',3);


--5-10 dogs is DONE Had to wait until Owners were added to get the OwnerIds

INSERT INTO Dog ([Name], OwnerId, Breed, Notes) VALUES  ('Angel', 5, 'Weimereiner' ,'Older dog likes to sleep alot');
INSERT INTO Dog ([Name], OwnerId, Breed, Notes) VALUES  ('Bonita', 6, 'Pit Bull' , 'Really happy and likes to jump up on you');
INSERT INTO Dog ([Name], OwnerId, Breed, Notes) VALUES  ('Fido', 7, 'Black Lab' , 'Has a thick fur and gets hot on walks');
INSERT INTO Dog ([Name], OwnerId, Breed, Notes) VALUES  ('Bongo', 8, 'Weiner Dog', 'Likes to chase things');
INSERT INTO Dog ([Name], OwnerId, Breed, Notes) VALUES  ('Fluffy', 8, 'Poodle', 'Is a big lap dog');



 --and each walker should have 1-2 walks recorded. Had to wait until Dogs were added to get the DogIds


INSERT INTO Walks([Date], Duration, WalkerId, DogId) VALUES (2020-03-17, 35, 1, 61);
INSERT INTO Walks([Date], Duration, WalkerId, DogId) VALUES (2020-03-17, 35, 1, 62);
INSERT INTO Walks([Date], Duration, WalkerId, DogId) VALUES (2020-03-17, 45, 2, 61);
INSERT INTO Walks([Date], Duration, WalkerId, DogId) VALUES (2020-03-17, 45, 2, 62);
INSERT INTO Walks([Date], Duration, WalkerId, DogId) VALUES (2020-03-17, 30, 3, 63);
INSERT INTO Walks([Date], Duration, WalkerId, DogId) VALUES (2020-03-18, 40, 3, 63);
INSERT INTO Walks([Date], Duration, WalkerId, DogId) VALUES (2020-03-18, 40, 4, 64);
INSERT INTO Walks([Date], Duration, WalkerId, DogId) VALUES (2020-03-18, 35, 4, 64);
INSERT INTO Walks([Date], Duration, WalkerId, DogId) VALUES (2020-03-19, 40, 4, 65);
INSERT INTO Walks([Date], Duration, WalkerId, DogId) VALUES (2020-03-19, 35, 4, 65);






