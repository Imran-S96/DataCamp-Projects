# **Analyzing Students' Mental Health**

![alt text](mentalhealth-1.jpg)

## Project Description

Does going to university in a different country affect your mental health? A Japanese international university surveyed its students in 2018 and published a study the following year that was approved by several ethical and regulatory boards.

The study found that international students have a higher risk of mental health difficulties than the general population, and that social connectedness (belonging to a social group) and acculturative stress (stress associated with joining a new culture) are predictive of depression.

Explore the `students` data using PostgreSQL to find out if you would come to a similar conclusion for international students and see if the length of stay is a contributing factor.

Here is a data description of the columns you may find helpful.

## Tables

| Field Name    | Description                                      |
| ------------- | ------------------------------------------------ |
| `inter_dom`     | Types of students (international or domestic)   |
| `japanese_cate` | Japanese language proficiency                    |
| `english_cate`  | English language proficiency                     |
| `academic`      | Current academic level (undergraduate or graduate) |
| `age`           | Current age of student                           |
| `stay`          | Current length of stay in years                  |
| `todep`         | Total score of depression (PHQ-9 test)           |
| `tosc`          | Total score of social connectedness (SCS test)   |
| `toas`          | Total score of acculturative stress (ASISS test) |

## Question

Explore and analyze the students data to see how the length of stay (stay) impacts the average mental health diagnostic scores of the international students present in the study.

* Return a table with nine rows and five columns.
* The five columns should be aliased as: `stay`, `count_int`, `average_phq`, `average_scs`, and `average_as`, in that order.
* The average columns should contain the average of the `todep` (PHQ-9 test), `tosc` (SCS test), and `toas` (ASISS test) columns for each length of stay, rounded to two decimal places.
* The `count_int` column should be the number of international students for each length of stay.
* Sort the results by the length of stay in descending order.

## [Solution](solution.SQL)

```sql
SELECT 
    "stay", 
    COUNT(*) AS "count_int", 
    ROUND(AVG("todep"), 2) AS "average_phq", 
    ROUND(AVG("tosc"), 2) AS "average_scs", 
    ROUND(AVG("toas"), 2) AS "average_as"
FROM students
WHERE "stay" IS NOT NULL AND "inter_dom" = 'Inter'
GROUP BY "stay"
ORDER BY "stay" DESC; 
```

## Final Query Table 

```
+------+------------+-------------+-------------+-------------+
| stay | count_int  | average_phq | average_scs | average_as  |
+------+------------+-------------+-------------+-------------+
| 10   | 1          | 13          | 32          | 50          |
| 8    | 1          | 10          | 44          | 65          |
| 7    | 1          | 4           | 48          | 45          |
| 6    | 3          | 6           | 38          | 58.67       |
| 5    | 1          | 0           | 34          | 91          |
| 4    | 14         | 8.57        | 33.93       | 87.71       |
| 3    | 46         | 9.09        | 37.13       | 78          |
| 2    | 39         | 8.28        | 37.08       | 77.67       |
| 1    | 95         | 7.48        | 38.11       | 72.8        |
+------+------------+-------------+-------------+-------------+
```