CREATE TABLE BST (
     N INT,
     P INT
    );
INSERT  INTO BST
VALUES
 (1,2),
        (3,2),
        (5,6),
        (7,6),
        (2,4),
        (6,4),
        (4,15),
        (8,9),
        (10,9),
        (12,13),
        (14,13),
        (9,11),
        (13,11),
        (11,15),
        (15,NULL);


#wrong
select N,COALESCE(root, type_node) as n_type from(
select N,P,
case when P is NULL then 'root'
end as root,
case when N in (select P from BST) then 'inner'
else 'leaf'
end as type_node
from BST) nt
order by N;

#correct

#Solution(MySQL)

select N,
       if(P is null, 'Root', if((select count(*) from BST where P = B.N)> 0, 'Inner', 'Leaf')) 
from BST as B 
order by N;

#Solution(SQL Server):
select N,
       case when P is null then 'Root'
            when (select count(*) from BST where P = B.N) > 0 then  
            'Inner'
            else 'Leaf'
       end
from BST as B 
order by N
;



       