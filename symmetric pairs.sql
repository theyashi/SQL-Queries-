use minidb;
create TABLE functions
(
    x INT, y INT
);

INSERT INTO functions ()
VALUES (20, 20)
      ,(20, 20)
      ,(20, 21)
      ,(23, 22)
      ,(22, 23)
      ,(21, 20);
      
select * from functions;

select * from functions
order by x;

select * from functions f1
join functions f2
on f1.x=f2.y and f1.y=f2.x;

#now check if symmetric - not needed

select f1.x, f1.y
from functions f1
join functions f2 on f1.x=f2.y and f1.y=f2.x
order by f1.x;

select f1.x, f1.y
from functions f1
join functions f2 on f1.x=f2.y and f1.y=f2.x
group by f1.x
order by f1.x;

select f1.x, f1.y
from functions f1
join functions f2 on f1.x=f2.y and f1.y=f2.x
group by f1.y
order by f1.x;


select (f1.x), f1.y
from functions f1
join functions f2 on f1.x=f2.y and f1.y=f2.x
where f1.x<=f1.y
group by f1.y
order by f1.x;