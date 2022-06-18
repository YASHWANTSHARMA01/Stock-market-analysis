-- The information was imported in the made construction "task" and the date section was 

-- changed to datetime information type 

-- changing the current chose pattern to assignments

use assignment;
-- Create another table named 'bajaj1' containing the date, close value, 20 Day MA and 50 Day MA. 

-- (This must be accomplished for each of the 6 stocks) 

-- Tables are made with shorten being utilized to constrain decimal spots upto 3 to make the information 

-- adequate and date is put away in DD-month-YY position

create table bajaj1 as(
select DATE_FORMAT(date, "%d %M %Y") as date,  `Close Price`,
truncate(AVG(`Close Price`) over (order by date rows 19 preceding), 3) as "20 DAY Moving Average",
truncate(AVG(`Close Price`) over (order by date rows 49 preceding), 3) as "50 DAY Moving Average"
FROM bajaj);

create table eicher1 as(
select DATE_FORMAT(date, "%d %M %Y") as date, `Close Price`,
truncate(AVG(`Close Price`) over (order by date rows 19 preceding), 3) as "20 DAY Moving Average",
truncate(AVG(`Close Price`) over (order by date rows 49 preceding), 3) as "50 DAY Moving Average"
FROM eicher);

create table tcs1 as(
select DATE_FORMAT(date, "%d %M %Y") as date, `Close Price`,
truncate(AVG(`Close Price`) over (order by date rows 19 preceding), 3) as "20 DAY Moving Average",
truncate(AVG(`Close Price`) over (order by date rows 49 preceding), 3) as "50 DAY Moving Average"
FROM tcs);

create table infosys1 as(
select DATE_FORMAT(date, "%d %M %Y") as date, `Close Price`,
truncate(AVG(`Close Price`) over (order by date rows 19 preceding), 3) as "20 DAY Moving Average",
truncate(AVG(`Close Price`) over (order by date rows 49 preceding), 3) as "50 DAY Moving Average"
FROM infosys);

create table hero1 as(
select DATE_FORMAT(date, "%d %M %Y") as date, `Close Price`,
truncate(AVG(`Close Price`) over (order by date rows 19 preceding), 3) as "20 DAY Moving Average",
truncate(AVG(`Close Price`) over (order by date rows 49 preceding), 3) as "50 DAY Moving Average"
FROM hero);

create table tvs1 as(
select DATE_FORMAT(date, "%d %M %Y") as date, `Close Price`,
truncate(AVG(`Close Price`) over (order by date rows 19 preceding), 3) as "20 DAY Moving Average",
truncate(AVG(`Close Price`) over (order by date rows 49 preceding), 3) as "50 DAY Moving Average"
FROM tvs);
-- Create an ace table containing the date and close cost of all the six stocks. 

-- (Column header at the cost is the name of the stock)

create table `master` as
select DATE_FORMAT(b.date, "%d %M %Y") as 'date', b.`Close Price` as 'Bajaj',
e.`Close Price` as 'Eicher',
i.`Close Price` as 'Infosys',
h.`Close Price` as 'Hero',
tcs.`Close Price` as 'TCS',
tvs.`Close Price` as 'TVS'
from bajaj b, eicher e, infosys i, hero h, tcs ,tvs;

-- Use the table created in Part(1) to generate buy and sell signal. 
-- Store this in another table named 'bajaj2'. Perform this operation for all stocks.

create table bajaj2 as
select date, `Close Price`,
case
    when `20 DAY Moving Average` > `50 DAY Moving Average` THEN "BUY"
    when `20 DAY Moving Average` < `50 DAY Moving Average` THEN "SELL"
    else "HOLD"
end as'Signal'
from bajaj1;

create table eicher2 as
select date, `Close Price`,
case
    when `20 DAY Moving Average` > `50 DAY Moving Average` THEN "BUY"
    when `20 DAY Moving Average` < `50 DAY Moving Average` THEN "SELL"
    else "HOLD"
end as'Signal'
from eicher1;

create table infosys2 as
select date, `Close Price`,
case
    when `20 DAY Moving Average` > `50 DAY Moving Average` THEN "BUY"
    when `20 DAY Moving Average` < `50 DAY Moving Average` THEN "SELL"
    else "HOLD"
end as'Signal'
from infosys1;

create table hero2 as
select date, `Close Price`,
case
    when `20 DAY Moving Average` > `50 DAY Moving Average` THEN "BUY"
    when `20 DAY Moving Average` < `50 DAY Moving Average` THEN "SELL"
    else "HOLD"
end as'Signal'
from hero1;

create table tcs2 as
select date, `Close Price`,
case
    when `20 DAY Moving Average` > `50 DAY Moving Average` THEN "BUY"
    when `20 DAY Moving Average` < `50 DAY Moving Average` THEN "SELL"
    else "HOLD"
end as'Signal'
from tcs1;

create table tvs2 as
select date, `Close Price`,
case
    when `20 DAY Moving Average` > `50 DAY Moving Average` THEN "BUY"
    when `20 DAY Moving Average` < `50 DAY Moving Average` THEN "SELL"
    else "HOLD"
end as'Signal'
from tvs1;

-- Create a User characterized work, that accepts the date as information and returns the sign 

-- for that specfic day ( Buy : Sell : Hold ) for the Bajaj stock. 

-- pass the date in datetime premeter

create function yes (d datetime)
returns char(4) deterministic
return (select `signal` from bajaj2 where date = DATE_FORMAT(d, "%d %M %Y") );
