-- Ver si es necesario
update ticket set changetime = changetime / 1000000 where changetime > 9999999999;
update ticket set time = time / 1000000 where time > 9999999999;
update wiki set time = time / 1000000 where time > 9999999999;
update milestone set due = due / 1000000 where due > 9999999999;
update milestone set completed = completed / 1000000 where completed > 9999999999;
update attachment set time = time / 1000000 where time > 9999999999;
update revision set time = time / 1000000 where time > 9999999999;
update ticket_change set time = time / 1000000 where time > 9999999999;

