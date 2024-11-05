/*	
	Assignment 2
	CS 350 Section 11
	Nicholas Littlefield CS350
*/


/* Problem 4: Show the data of each person whose name contains the substring 'Hara' */

MATCH (n:Person)
WHERE n.name CONTAINS 'Hara'
RETURN n.name, n.dob, n.id


/* Problem 5: Show the number of squads that 'Kelley O Hara' was in. */

MATCH (p:Person {name: 'Kelley O Hara'})-[:IN_SQUAD]->(s:Squad)
RETURN p.name AS name, COUNT(s) AS numberOfSquads


/* Problem 6: Show the name of each player (Person) for team 'USA'  who has scored a goal in the tournaments.

MATCH (p:Person)-[:REPRESENTS]->(t:Team {name: 'USA'})
MATCH (p:Person)-[:SCORED_GOAL]->(m:Match)-[:IN_TOURNAMENT]->(tr:Tournament)
RETURN DISTINCT p.name
