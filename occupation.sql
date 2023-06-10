CREATE TABLE Occupations (
     NAME VARCHAR(21),
     Occupation VARCHAR(21)
    );
INSERT  INTO Occupations
VALUES
        ('Samantha','Doctor'),
        ('Julia','Actor'),
        ('Maria','Actor'),
        ('Meera','Singer'),
        ('Ashley','Professor'),
        ('Ketty','Professor'),
        ('Christeen','Professor'),
        ('Jane','Actor'),
        ('Jenny','Doctor'),
        ('Priya','Singer');

select * from occupations;

select concat(name, '(', substr(occupation,1,1), ')') as coll from occupations;

with cte_f as(
select distinct(occupation), count(occupation) 
over(partition by occupation) as grp_occ 
from occupations)
select concat(occupation, '-', grp_occ) from cte_f
order by grp_occ, occupation;









SELECT rn, min(Doctor), min(Professor), min(Singer), min(Actor)
FROM 
( Select
ROW_NUMBER() OVER (PARTITION BY Occupation order by Name) rn, 
CASE 
WHEN Occupation = 'Doctor' then Name
end as Doctor,
CASE 
WHEN Occupation = 'Professor' then Name
end as Professor,
CASE 
WHEN Occupation = 'Singer' then Name
end as Singer,
CASE 
WHEN Occupation = 'Actor' then Name
end as Actor
from OCCUPATIONS) a
group by rn
order by rn;








SELECT
    Doctor,
    Professor,
    Singer,
    Actor
FROM
    (SELECT 
         ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) rn,
         Name,
         Occupation
	FROM 
         Occupations
    ) AS source 
PIVOT
    (MAX(Name) FOR [occupation] IN ([Doctor],[Professor],[Singer],[Actor])) as pvt
ORDER BY rn;


##DROP TABLE Occupations;