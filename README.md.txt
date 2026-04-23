# IPL Match Strategy Analysis (2008–2025)

## 📌 Project Overview

This project analyzes Indian Premier League (IPL) match data to uncover strategic patterns in scoring, player performance, and match outcomes. The goal is to understand how different phases of a T20 match influence team success and player impact.

The analysis is built using SQL for data processing and Power BI for interactive visualization.

---

## 🎯 Objectives

* Analyze scoring patterns across match phases (Powerplay, Middle, Death)
* Compare performance of winning vs losing teams
* Evaluate batting first vs chasing strategies
* Identify top-performing teams in high-pressure situations (death overs)
* Analyze player performance based on match phases

---

## 📊 Dataset

* **Source:** IPL Ball-by-Ball and Match Data
* **Time Period:** 2008 – 2025
* **Tables Used:**

  * `ball_by_ball`
  * `matches`

---

## 🛠 Tools & Technologies

* **SQL (SQLite):** Data cleaning, transformation, and aggregation
* **Power BI:** Dashboard creation and visualization
* **Excel:** Intermediate data storage and organization

---

## 📈 Dashboard Pages

### 🔹 1. Match Strategy Analysis

* Run Rate by Phase
* Toss Decisions Impact
* Winning vs Losing Teams (Phase-wise)
* Batting First vs Chasing Comparison

👉 Key Insight: Death overs have the highest impact on match outcomes, with significantly higher run rates.

---

### 🔹 2. Team Performance Analysis

* Top Teams in Death Overs
* IPL Run Rate Trend (2008–2025)
* Key performance indicators (average run rate, best season, best team)

👉 Key Insight: Teams with strong death-over performance consistently rank higher.

---

### 🔹 3. Player Performance Analysis (Phase-wise)

* Top Batsmen (Runs – Phase-wise)
* Top Batsmen (Strike Rate – Phase-wise)
* Top Bowlers (Wickets – Phase-wise)
* Most Economical Bowlers (Phase-wise)

👉 This page focuses on **role-based performance**, highlighting how players contribute differently across match phases.

---

## 🔍 Key Insights

* 🔥 **Death Overs Dominance:** Highest scoring rates occur in death overs, making them crucial for match outcomes
* 🏏 **Winning Teams Perform Better Across All Phases:** Especially noticeable in death overs
* ⚖️ **Batting First vs Chasing:** Minimal difference overall, but situational advantages exist
* 📈 **Rising Scoring Trend:** IPL run rates have steadily increased over the years
* 🎯 **Role-Based Player Impact:** Certain players excel specifically in Powerplay or Death overs rather than overall

---

## ⚠️ Note on Player Analysis

Player rankings are **phase-specific** and may include players with high efficiency in limited opportunities. The focus is on **impact within a match phase**, rather than overall career totals.

---

## 📂 Project Structure

```
ipl-match-analysis/
│
├── dashboard/
│   └── IPL_Dashboard.pbix
│
├── data/
│   └── IPL_Analysis.xlsx
│
├── images/
│   ├── page1_match_strategy.png
│   ├── page2_team_analysis.png
│   └── page3_player_analysis.png
│
├── sql/
│   └── queries.sql
│
└── README.md
```

---

## 🚀 Conclusion

This project demonstrates how data analytics can uncover strategic insights in cricket. By focusing on match phases, the analysis highlights the importance of situational performance over aggregate statistics.

The approach can be extended to team selection, match strategy optimization, and predictive modeling.

---

## 📌 Future Improvements

* Add player consistency filters (minimum balls/matches)
* Include venue-based analysis
* Build predictive models for match outcomes
* Enhance interactivity with more advanced filters

---

## 👤 Author

Vinay Mehra

---
