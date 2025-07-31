SELECT *
FROM (
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) AS january_jobs;

-- SubQuery ends here

WITH january_jobs AS (
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) -- CTE ends here

SELECT *
FROM january_jobs;

-- EXAMPLES STOP HERE FOR CTE AND SUBQUERY

