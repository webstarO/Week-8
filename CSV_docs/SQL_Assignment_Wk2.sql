SELECT 
    submission_date, 
    COUNT(DISTINCT hacker_id) as unique_hackers,
    hacker_id, 
    name, 
    MAX(submissions) as max_submissions
FROM (
    SELECT 
        hacker_id, 
        name, 
        DATE(submission_time) as submission_date, 
        COUNT(*) as submissions
    FROM Submissions
    JOIN Hackers ON Submissions.hacker_id = Hackers.hacker_id
    WHERE submission_time BETWEEN '2016-03-01' AND '2016-03-15'
    GROUP BY hacker_id, submission_date
) AS t
GROUP BY submission_date
ORDER BY submission_date;
