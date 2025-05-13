
DROP TABLE IF EXISTS #LeagueTable;
 
SELECT
    fm.HomeTeam AS Team
    ,CASE WHEN fm.FTR = 'H' THEN 1  ELSE 0 END AS Won -- SERACHED CASE
    ,CASE fm.ftr WHEN 'D' THEN 1 ELSE 0 END AS Drawn -- simple CASE
    ,fm.FTHG AS GF
    ,fm.FTAG AS GA
INTO #LeagueTable
    FROM FootballMatch fm
UNION ALL
SELECT
    fm.AwayTeam
    ,CASE WHEN fm.FTR = 'A' THEN 1 ELSE 0 END AS Won
    ,CASE fm.ftr WHEN 'D' THEN 1 ELSE 0 END AS Drawn -- simple CASE
    ,fm.FTAG
    ,fm.FTHG
FROM  FootballMatch fm
 
SELECT * FROM #LeagueTable;
 
SELECT
    t.Team AS Team
    ,count(*) AS Played
    ,SUM(t.Won) AS Won
    ,SUM(t.Drawn) AS Drawn
    ,SUM(T.GF) AS GF    
    ,SUM(T.GA) AS GA
FROM
    #LeagueTable t
GROUP BY t.Team
ORDER BY t.Team;
 
 
 
 

/*
The FootballMatch table shows the EPL matches played in 2024/25 season as of 16th March 2025
 
Important Columns
Date - Match Date (dd/mm/yy)
Time - Time of match kick off
HomeTeam- Home Team
AwayTeam - Away Team
FTHG -Full Time Home Team Goals
FTAG - Full Time Away Team Goals
FTR - Full Time Result (H=Home Win, D=Draw, A=Away Win)
 
Full details at https://zomalex.co.uk/datasets/football_match_dataset.html

 
SELECT
    fm.Date
    , fm.HomeTeam
    , fm.AwayTeam
    , fm.FTHG
    , fm.FTAG
    , fm.FTR
FROM
    FootballMatch fm
 

How many games have been played?.  
- In total
- By each team
- By Month
*/
 




-- How many goals have been scored in total

 
-- How many goals have been scored by each team?
 
/*SELECT
    count(*) AS Numberofmatches
    ,Month(fm.[Date]) AS MonthNumber
    ,year(fm.date) AS YearName
    ,Datename(Month,fm.DATE)AS MonthName
FROM
    FootballMatch fm
GROUP BY Month(fm.[Date]) , Datename(Month,fm.DATE),year(fm.date)
order by YearName, monthnumber



;
WITH
    cte
    (Team,Totalgoals)
    AS
    (SELECT
                fm.hometeam 
    ,Sum(fm.fthg)
            FROM
                FootballMatch fm
            GROUP BY fm.HomeTeam
        UNION ALL
            SELECT
                fm.AwayTeam 
    ,Sum(fm.FTAG)
            FROM
                FootballMatch fm
            GROUP BY fm.AwayTeam
    )
SELECT
    cte.Team
    ,sum(cte.totalgoals) AS totalgoals
FROM
    cte
GROUP BY
cte.team
ORDER BY totalgoals DESC 


DROP TABLE IF EXISTS #LeagueTable;
 
SELECT
    fm.HomeTeam as Team
    , SUM(fm.FTHG) AS GF
     ,1 as GA
INTO #LeagueTable
FROM
    FootballMatch fm
group by fm.HomeTeam
UNION ALL
SELECT
    fm.AwayTeam
    , SUM(fm.FTAG)
    , 1 as GA
FROM
    FootballMatch fm
group by fm.AwayTeam  
 
SELECT t.Team As Team,
    SUM(T.GF) as GF
    , SUM(T.GA) as GA
FROM #LeagueTable t
    group by t.Team
    order by t.Team */



     
