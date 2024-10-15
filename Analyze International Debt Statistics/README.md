# Analyze International Debt Statistics

![alt text](image.jpg)

## Project Description

Humans not only take debts to manage necessities. A country may also take debt to manage its economy. For example, infrastructure spending is one costly ingredient required for a country's citizens to lead comfortable lives. The World Bank is the organization that provides debt to countries.

In this project, you are going to analyze international debt data collected by The World Bank. The dataset contains information about the amount of debt (in USD) owed by developing countries across several categories.

## Tables 

### `international_debt` table

| Column | Definition | Data Type |
|-|-|-|
|country_name|Name of the country|`varchar`|
|country_code|Code representing the country|`varchar`|
|indicator_name|Description of the debt indicator|`varchar`|
|indicator_code|Code representing the debt indicator|`varchar`|
|debt|Value of the debt indicator for the given country (in current US dollars)|`float`|

## Question 1 -- num_distinct_countries 

What is the number of distinct countries present in the database?

#### [Solution](solution.sql)

```
SELECT COUNT(DISTINCT "country_name") AS total_distinct_countries FROM public.international_debt;
```

#### Query Table

```
+--------------------------+
| total_distinct_countries |
+--------------------------+
| 124                      |
+--------------------------+
```
## Question 2 -- highest_debt_country 

What country has the highest amount of debt?

#### [Solution](solution.sql)

```
SELECT "country_name", SUM("debt") AS "total_debt" FROM public.international_debt
GROUP BY "country_name"
ORDER BY "total_debt" DESC
LIMIT 1;
```

#### Query Table

```
+--------------+---------------------+
| country_name | total_debt          |
+--------------+---------------------+
| China        | 285793494734.2      |
+--------------+---------------------+
```

## Question 3 -- lowest_principal_repayment

What country has the lowest amount of repayments?

#### [Solution](solution.sql)

```
SELECT "country_name", "indicator_name", "debt" AS "lowest_repayment" FROM public.international_debt
WHERE "indicator_code" = 'DT.AMT.DLXF.CD'
ORDER BY "debt"
LIMIT 1;
```

#### Query Table

```
+--------------+-------------------------------------------------------------+----------------+
| country_name | indicator_name                                               | lowest_repayment|
+--------------+-------------------------------------------------------------+----------------+
| Timor-Leste  | Principal repayments on external debt, long-term (AMT, US$)  | 825000         |
+--------------+-------------------------------------------------------------+----------------+

```



