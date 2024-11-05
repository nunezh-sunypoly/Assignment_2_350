/* Assignment 2
	CS 350 Section 11
  Henry Nunez    */

/* 1. Show the name of each tournament included in the database. */
MATCH (t:Tournament)
RETURN t.name AS TournamentName;

/* 2. Show the name of each player (Person) who has ever represented the USA. */
MATCH (p:Person)-[:REPRESENTS]->(team:Team {name: 'USA'})
RETURN p.name;

/*3. Show the date of birth (dob) of Lauren Holiday. */

MATCH (p:Person {name: 'Lauren Holiday'})
RETURN p.dob AS DateOfBirth;

/* 4. Show the data of each person whose name contains the substring 'Hara' Hint: you may do match followed by WHERE n.name CONTAINS */
MATCH (p:Person)
WHERE p.name CONTAINS 'Hara'
RETURN p.name, p.dob;

/* 5. Show the number of squads that 'Kelley O Hara' was in. */
MATCH (p:Person {name: 'Kelley O Hara'})-[:IN_SQUAD]->(s:Squad)
RETURN COUNT(s) AS NumberOfSquads;

/* 6. Show the name of each player (Person) for team 'USA' who has scored a goal in the tournaments. */
MATCH(p:Person)-[:REPRESENTS]->(team:Team {name: 'USA'}) 
MATCH(p:Person)-[:SCORED_GOAL]->(m:Match)-[:IN_TOURNAMENT]->(t:Tournament) RETURN DISTINCT p.name;

/* 7. Who was the coach of the USA squad in 2019 (that is, the squad whose id is "USA in 2019")? */
MATCH (t:Team {name: 'USA'})-[:NAMED]-> (s:Squad)
MATCH (p:Person)-[:COACH_FOR]->(s:Squad)
WHERE s.id ='USA in 2019'
RETURN t.name, p.name;

/* 8. Show all the matches in which "Rose Lavelle" scored a goal. */
MATCH (p:Person {name: 'Rose Lavelle'})-[:SCORED_GOAL]->(m:Match) RETURN m.id, m.date, p.name;

/* 9. Show the name of each person who represented team "USA" (as player) and also coached for some squad in the tournaments (not at the same time, of course). */
MATCH (p:Person)-[:REPRESENTS]->(team:Team {name: 'USA'}) MATCH(p:Person)-[:COACH_FOR]->(s:Squad)-[]->(t:Tournament) RETURN t.name, p.name;
