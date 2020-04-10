
--Write a query to return all owners names and the name of their neighborhood.

SELECT o.Name, n.Name 
From Owner o
LEFT JOIN Neighborhood n ON o.NeighborhoodId = n.Id


--Write a query to return the name and neighborhood of a single owner (can be any Id).
SELECT o.Name, n.Name 
From Owner o
LEFT JOIN Neighborhood n ON o.NeighborhoodId = n.Id
Where o.Id = 6

--Write a query to return all walkers ordered by their name.
--NOTE: SQL offers the ability to order by columns in a table.

SELECT *
FROM Walker
ORDER BY Name ASC

--Write a query to return a list of unique dog breeds.
--NOTE: Take a look at SQL SELECT DISTINCT Statement for some guidance.

SELECT DISTINCT Breed FROM Dog;



--Write a query to return a list of all dog's names along with their owner's name and what neighborhood they live in
--NOTE: sometimes you need to join more than two tables in a query.

SELECT d.Name, o.Name, n.Name
From Dog d
LEFT JOIN Owner o ON o.id = d.OwnerId
LEFT JOIN Neighborhood n ON o.NeighborhoodId = n.Id



--Return a list of owners along with a count of how many dogs they have
--NOTE: SQL has a group by just like LINQ does.

SELECT o.name, COUNT(d.ownerId) AS DogsOwned
FROM Dog d
Left Join Owner o ON d.ownerId = o.id
GROUP BY o.Name


--Return a list of walkers along with the amount of walks they've recorded

SELECT Walker.Name, COUNT(Walks.WalkerId) AS TimesWalked
FROM Walks 
Left Join Walker  ON Walks.WalkerId = Walker.id
GROUP BY Walker.Name


--Return a list of all neighborhoods with a count of how many walkers 
--are in each, but do not show neighborhoods that don't have any walkers.

INSERT INTO Neighborhood ([Name]) VALUES ('NoDogLoversVille');


SELECT n.[Name] AS Neighborhood, COUNT(w.NeighborhoodId) AS Walkers
FROM Walker w
LEFT JOIN Neighborhood n ON w.NeighborhoodId = n.Id
GROUP BY n.[Name]


--Return a list of dogs that have been walked in the past week
--NOTE: It may help to know how to format dates
SELECT * 
FROM Walks
--WHERE [Date] BETWEEN '2020-03-12 00:00:00' AND GETDATE();
--WHERE [Date] BETWEEN '2020-03-12 00:00:00' AND '2020-03-26 00:00:00';
--WHERE [Date] BETWEEN #6/22/1905# #12:00:00# AND #6/24/1905 12:00:00 AM#;



--Return a list of dogs that have not been on a walk
INSERT INTO Dog ([Name], OwnerId, Breed, Notes) VALUES  ('Buddy', 5, 'Snauzer' ,'Never Goes out');

SELECT d.[Name], d.Breed
FROM Dog d
LEFT JOIN Walks w ON d.Id = w.DogId
WHERE w.Id IS NULL
GROUP BY d.[Name], d.Breed