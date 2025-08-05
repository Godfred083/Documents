/*
What are the most optimal skills to learn (That is, high demand and a high paying skill)?
- Identify skills in high demand and associated with high average salaries for data analysts
- Concentrate on remote positions with specified salaries

Reason: Target skills that ofer job security (high demand) and financial benefits (high salaries), 
            while offering insight fro career development in Data Analysis

*/


SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg),0) AS avg_salary


FROM job_postings_fact

INNER JOIN skills_job_dim
ON job_postings_fact.job_id = skills_job_dim.job_id

INNER JOIN skills_dim
ON skills_job_dim.skill_id = skills_dim.skill_id

WHERE job_title_short = 'Data Analyst' AND job_work_from_home = TRUE

GROUP BY skills_dim.skill_id

HAVING COUNT(skills_job_dim.job_id) > 10

ORDER BY demand_count DESC
