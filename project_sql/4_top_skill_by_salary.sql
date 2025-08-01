/*
Answer: What are the top skills based on salary?
    Focuses on roles with specified salaries, regardless of location.
    Why? It reveals how different skills impact salary levels for Data Analysts and helps identify
    the most financially rewarding skills to acquire or improve
*/

SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = 'True'
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25

/*
🔥 Top Trends in High-Paying Data Analyst Skills
1. Big Data & Cloud Skills Dominate the Top
PySpark ($208K), Databricks ($141K), Airflow ($126K), GCP ($122K) are tied to big data engineering or cloud-based analytics.

These roles demand distributed data processing, orchestration, and cloud platform knowledge, which command higher salaries due to complexity and demand.

2. Version Control & DevOps Tools Are Lucrative
Bitbucket ($189K), GitLab ($154K), Jenkins ($125K), Atlassian ($131K) suggest that DevOps-adjacent skills are increasingly valuable for data analysts working on collaborative, production-grade pipelines.

3. AI/ML-Related Tools Lead to Premium Pay
Watson ($160K), DataRobot ($155K), Scikit-learn ($125K), Pandas/Numpy/Jupyter (~$143K–152K) highlight that ML fluency and tooling significantly boost analyst salaries.

These skills bridge the gap between analyst and data scientist roles.

4. Programming and Infrastructure Matter
Golang ($145K), Swift ($153K), Scala ($124K) show crossover into software engineering territory. Employers increasingly value data analysts with engineering chops.

5. Specialized Databases and Search Tech Are High-Paying
Couchbase ($160K), Elasticsearch ($145K), PostgreSQL ($123K) reflect demand for analysts who can query and manage non-relational or high-performance data systems.

6. Data Visualization & BI Tools Are Present but Lower in Rank
Only MicroStrategy ($121K) makes the list from traditional BI tools — suggesting basic dashboarding isn't the top-paying niche.

Higher pay aligns more with back-end data prep, orchestration, or ML rather than just reporting.

7. Communication & Collaboration Platforms Matter Too
Notion ($125K), Twilio ($127K) are interesting outliers — they hint at demand for analysts who can automate communication workflows or work within product ecosystems.

🧠 Summary of High-Earning Skill Types
Skill Type	Examples	Avg Salary Range
Big Data / Cloud	PySpark, Databricks, GCP, Airflow	$122K–208K
DevOps / Workflow	Bitbucket, GitLab, Jenkins, Atlassian	$125K–189K
AI / ML	Watson, DataRobot, Scikit-learn, Pandas	$125K–160K
Programming Languages	Golang, Swift, Scala	$124K–153K
Infra / DBs	Couchbase, Elasticsearch, PostgreSQL	$123K–160K
BI / Viz	MicroStrategy	~$121K
Other / Tools	Notion, Twilio, Jupyter	$125K–153K

If you'd like, I can also visualize this with a chart or group the skills by category for easier reference. Let me know!
*/