#SQL Queries

##Query 1 — Phase Run Rate

SELECT 
CASE 
WHEN over BETWEEN 0 AND 5 THEN 'Powerplay'
WHEN over BETWEEN 6 AND 14 THEN 'Middle'
ELSE 'Death'
END AS phase,
ROUND(SUM(batsman_runs)*6.0/COUNT(*),2) AS run_rate
FROM ball_by_ball
GROUP BY phase;


##Query 2 — Phase Wickets

SELECT 
CASE 
WHEN over BETWEEN 0 AND 5 THEN 'Powerplay'
WHEN over BETWEEN 6 AND 14 THEN 'Middle'
ELSE 'Death'
END AS phase,
COUNT(player_dismissed) AS wickets
FROM ball_by_ball
WHERE player_dismissed IS NOT NULL
GROUP BY phase;


##Query 3 — Winning vs Losing Run Rate by Phase

SELECT
CASE 
WHEN b.batting_team = m.winner THEN 'Winning Team'
ELSE 'Losing Team'
END AS match_outcome,

CASE 
WHEN b.over BETWEEN 0 AND 5 THEN 'Powerplay'
WHEN b.over BETWEEN 6 AND 14 THEN 'Middle'
ELSE 'Death'
END AS phase,

ROUND(SUM(b.batsman_runs)*6.0/COUNT(*),2) AS run_rate
FROM ball_by_ball b
JOIN matches m
ON b.matchId = m.matchId
GROUP BY match_outcome, phase
ORDER BY match_outcome, phase;


##Query 4 — Batting First vs Chasing by Phase

SELECT
CASE 
WHEN inning = 1 THEN 'Batting First'
ELSE 'Chasing'
END AS innings_type,

CASE 
WHEN over BETWEEN 0 AND 5 THEN 'Powerplay'
WHEN over BETWEEN 6 AND 14 THEN 'Middle'
ELSE 'Death'
END AS phase,

ROUND(SUM(batsman_runs)*6.0/COUNT(*),2) AS run_rate
FROM ball_by_ball
GROUP BY innings_type, phase
ORDER BY innings_type, phase;


##Query 5 — Toss Decision Impact

SELECT
m.toss_decision AS toss_decision,
CASE 
WHEN m.toss_winner = m.winner THEN 'Toss Winner Won'
ELSE 'Toss Winner Lost'
END AS match_result,
COUNT(*) AS matches
FROM matches m
GROUP BY toss_decision, match_result
ORDER BY toss_decision;


##Query 6 — Death Over Teams

SELECT
batting_team,
ROUND(SUM(batsman_runs)*6.0/COUNT(*),2) AS death_over_run_rate
FROM ball_by_ball
WHERE over BETWEEN 15 AND 19
GROUP BY batting_team
ORDER BY death_over_run_rate DESC;


##Query 7 — Top Batsmen Runs by Phase

WITH phase_runs AS (
SELECT
CASE 
WHEN over BETWEEN 0 AND 5 THEN 'Powerplay'
WHEN over BETWEEN 6 AND 14 THEN 'Middle'
ELSE 'Death'
END AS phase,
batsman,
SUM(batsman_runs) AS total_runs
FROM ball_by_ball
GROUP BY phase, batsman
)

SELECT *
FROM (
SELECT
phase,
batsman,
total_runs,
ROW_NUMBER() OVER(PARTITION BY phase ORDER BY total_runs DESC) AS rank
FROM phase_runs
)
WHERE rank <= 5;


##Query 8 — Top Batsmen Strike Rate by Phase

WITH phase_sr AS (
SELECT
CASE 
WHEN over BETWEEN 0 AND 5 THEN 'Powerplay'
WHEN over BETWEEN 6 AND 14 THEN 'Middle'
ELSE 'Death'
END AS phase,
batsman,
SUM(batsman_runs) AS runs,
COUNT(*) AS balls,
ROUND(SUM(batsman_runs)*100.0/COUNT(*),2) AS strike_rate
FROM ball_by_ball
GROUP BY phase, batsman
)

SELECT *
FROM (
SELECT
phase,
batsman,
strike_rate,
ROW_NUMBER() OVER(PARTITION BY phase ORDER BY strike_rate DESC) AS rank
FROM phase_sr
WHERE balls > 30
)
WHERE rank <= 5;


##Query 9 — Best Economy Bowlers by Phase

WITH phase_econ AS (
SELECT
CASE 
WHEN over BETWEEN 0 AND 5 THEN 'Powerplay'
WHEN over BETWEEN 6 AND 14 THEN 'Middle'
ELSE 'Death'
END AS phase,
bowler,
SUM(batsman_runs) AS runs_conceded,
COUNT(*)/6.0 AS overs,
ROUND(SUM(batsman_runs)/(COUNT(*)/6.0),2) AS economy
FROM ball_by_ball
GROUP BY phase, bowler
)

SELECT *
FROM (
SELECT
phase,
bowler,
economy,
ROW_NUMBER() OVER(PARTITION BY phase ORDER BY economy ASC) AS rank
FROM phase_econ
WHERE overs > 5
)
WHERE rank <= 5;


##Query 10 — Top Wicket Takers by Phase

WITH phase_wickets AS (
SELECT
CASE 
WHEN over BETWEEN 0 AND 5 THEN 'Powerplay'
WHEN over BETWEEN 6 AND 14 THEN 'Middle'
ELSE 'Death'
END AS phase,
bowler,
COUNT(player_dismissed) AS wickets
FROM ball_by_ball
WHERE player_dismissed IS NOT NULL
GROUP BY phase, bowler
)

SELECT *
FROM (
SELECT
phase,
bowler,
wickets,
ROW_NUMBER() OVER(PARTITION BY phase ORDER BY wickets DESC) AS rank
FROM phase_wickets
)
WHERE rank <= 5;

