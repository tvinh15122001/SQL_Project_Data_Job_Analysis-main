
SELECT 
    skills,
    round(avg(salary_year_avg), 2) as avg_salary

FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst' 
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = 'Yes'
GROUP BY skills
ORDER BY avg_salary DESC
limit 25
