
-- Retrieve lost of games ordered by data from recent to least recent
  SELECT * 
    FROM Game
  ORDER BY time DESC;

--Retrieve games that occurred in the past week
  SELECT *
    FROM Game
  WHERE time >= CURRENT_TIMESTAMP - interval '7 days';

--Retrieve list of players with non null names
  SELECT *
  FROM Player
  WHERE name IS NOT NULL;

--Retrieve list of IDs for players with score larger than 2000
  SELECT DISTINCT PlayerID
  FROM PlayerGame
  WHERE score > 2000;

--Retrieve list of players who have Gmail accounts
  SELECT *
  FROM Player
  WHERE emailAddress LIKE '%gmail%';



--------------------------------------Multi-table--------------------------------------

--Retrieve "The King" game scores in decreasing order
  SELECT score
    FROM Player, PlayerGame
    WHERE Player.ID = PlayerGame.PlayerID AND Player.name = 'The King'
    ORDER BY score DESC;

--Retrieve the nameof winner of game played on 2006-06-28
  SELECT name
    FROM Player, PlayerGame, Game
    WHERE Player.Id = PlayerGame.playerID AND PlayerGame.GameID = Game.ID AND Game.time = timestamp '2006-06-28 13:20:00'
    ORDER BY score DESC
    Limit 1;



------------------------------------------------------------Questions----------------------------------------------------------------

SELECT P1.name
FROM Player AS P1, Player AS P2
WHERE P1.name = P2.name
  AND P1.ID < P2.ID;
--To avoid displaying the names more than twice, ensures it displays each result once
--When wanting to compare data in a table with other data that is similar in structure.



