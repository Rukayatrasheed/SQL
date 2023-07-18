create table fraudulent(step int,
type varchar(20),
amount float,
nameorig varchar (20),
oldbalanceorg float,
newbalanceorig float,
namedest varchar (20),
oldbalancedest float,
newbalancedest float,
isfraud int,
isflaggedfraud int);
select * from fraudulent;

-- question 1
-- how many transactions occured per transaction type
select type,
count (*)
from fraudulent
group by type
order by 2 desc;

--returns each type of transactions and their counts, in order of desc

--question 2
-- which transaction type has the highest fraudulent transaction
select type,
count (*)
from fraudulent
where isfraud = 1
group by type;
--returns cash out as the highest transaction type with fraud

--question 3
--what is the average fraudulent transaction amount

select type,round(avg(amount))
from fraudulent
where isfraud =1
group by type;
-- returns the avg of the 2 types of fraud transaction

-- question 4
--max fraudulent transaction amount

select max(amount)
from fraudulent
where isfraud = 1;

-- question 5
--min fraudulent transaction
select min(amount)
from fraudulent
where isfraud = 1;


--question 6
--who are the top 20 customers with the highest amount defrauded
select * from fraudulent;

select nameorig , 
sum (amount)
from fraudulent
where isfraud = 1
group by nameorig
order by 2 desc
limit 20;

-- question 7
-- how effective is the bank in flagging fraud transaction

select * from fraudulent;
select sum (isflaggedfraud) as flagged, sum (isfraud) as fraud,
sum(isfraud)/sum (isflaggedfraud) as effectiveness
from fraudulent;


-- question 8
-- top 20 fraudsters
select namedest,
sum(amount) as totalamount
from fraudulent
where isfraud =1
group by namedest
order by 2 desc
limit 20;

-- question 9
-- what is the total amount defrauded by top 20 fraudsters

select round(sum(amount)) as totalamountdefrauded
from fraudulent
where isfraud =1
limit 20;