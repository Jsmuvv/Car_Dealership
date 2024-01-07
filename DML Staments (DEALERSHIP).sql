-- Need procedures to add information to tables

-- sales person
-- 		1: Jimmy Hendrix
-- 		2: Brittany Howard
-- 		3: Eric Clapton
-- +++++++++++++++++++++++++++++++++++++++++++++++++
-- CAR
-- 		Make: Ford, Model: Fusion, Year: 2022, Serial Number: 983459456349
-- 		Make: Ford, Model: Explorer, Year: 2015, Serial Number: 954386523904
--		Make: Ford, Model: Bronco, Year: 2013, Serial Number: 447584572020
-- +++++++++++++++++++++++++++++++++++++++++++++++++
-- Mechanic
-- 		1:Kanye West , 11/22/2023, 3:42 pm
-- 		2:Jay Z , 11/25/2023, 5:15 pm
-- 		3:Jamie Foxx, 12/24/2023, 1:00 am 
-- ++++++++++++++++++++++++++++++++++++++++++++++++++
-- Ticket
--		1: Cleaning
-- 		2: Service
-- 		3: Service
-- ++++++++++++++++++++++++++++++++++++++++++++++++++
-- Customer
-- 		1:Dewayne Johnson, TheRock@gmail.com, Cleaning
-- 		2:Micheal B. Jordan, Creed@yahoo.com, Service
-- 		3:Zendaya Coleman, shakeitup@gmail.com, Service
-- +++++++++++++++++++++++++++++++++++++++++++++++++++
-- Invoice
-- 		1: Dewayne Johnson, $1100.93, Cleaning , Kanye West, Ford Fusion, Jimmy Hendrix
-- 		2: Micheal B Jordan, $2553.97, Service, Jay Z, Ford Bronco, Brittany howard
-- 		3: Zendaya Coleman, $1587.15, Service, Jamie Fox, Ford Ranger, Eric clapton

-- Ask sbout foreign Keys and constraints a how to make all information go through one table labeled history


-- Sales Person Procedure 
SELECT *
FROM salesperson 

insert INTO salesperson (
	salesperson_id,
	name
) VALUES (
	1,
	'Jimmy Hendrix'
);

CREATE PROCEDURE add_salesperson(
	s_id integer,
	name VARCHAR(50)
)
LANGUAGE plpgsql
AS 
$$
BEGIN
	insert INTO salesperson (
	salesperson_id,
	name
	) VALUES (
		s_id,
		name
	);
	COMMIT;
END
$$;

 CALL add_salesperson(2,'Brittany Howard')
 
 CALL add_salesperson(3,'Eric Clapton')
 
 SELECT *
 FROM salesperson 

 -- Sales Person Procedure 
 
 -- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 
 -- ticket Procedure 
 
 CREATE PROCEDURE add_ticket(
 	ticket_id INTEGER,
 	service VARCHAR(50)
 )
 LANGUAGE plpgsql
AS
$$
BEGIN
 	INSERT INTO ticket (
 	ticket_id,
 	service
 	) VALUES (
 	ticket_id,
 	service
 	);
 	COMMIT;
END
$$;

CALL add_ticket (1,'cleaning')

CALL add_ticket (2,'service')

CALL add_ticket (3,'service')

SELECT *
FROM ticket 

-- ticket Procedure 

-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- mechanic procedure

CREATE PROCEDURE add_mechanic(
	mechanic_id INTEGER,
	name VARCHAR(50)
)
LANGUAGE plpgsql
AS 
$$
BEGIN
	INSERT INTO mechanic (
		mechanic_id,
		name 
		) VALUES (
		mechanic_id,
		name
		);
		COMMIT;
END
$$;

CALL add_mechanic (1,'Kanye West')

CALL add_mechanic (2,'Jay Z')

CALL add_mechanic (3,'Jamie Foxx')

SELECT*
FROM mechanic 

-- mechanic procedure

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- car procedure

CREATE OR REPLACE PROCEDURE add_car(
	car_id INTEGER,
	make_id VARCHAR(50),
	model_id VARCHAR(50),
	YEAR INTEGER,
	serial_number TEXT 
) 
LANGUAGE plpgsql
AS
$$
BEGIN
	INSERT INTO car(
	car_id,
	make_id,
	model_id,
	YEAR,
	serial_number
	) VALUES (
	car_id, 
	make_id,
	model_id,
	YEAR,
	serial_number
	);
	COMMIT;
END
$$;

CALL add_car (1,'ford','fusion',2022,'983459456349'::text)

CALL add_car (2, 'Ford', 'Explorer',2015,'954386523904'::text)

CALL add_car (3,'Ford','Bronco',2013,'447584572020'::text)

SELECT*
FROM car 

-- car procedure

-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- Customer Procedure 

CREATE PROCEDURE add_customer (
	customer_id INTEGER,
	name VARCHAR(50),
	email VARCHAR(50),
	service_id VARCHAR(100)
)
LANGUAGE plpgsql
AS
$$
BEGIN
	INSERT INTO customer(
	customer_id,
	name,
	email,
	service_id
	) VALUES (
	customer_id,
	name,
	email,
	service_id
	);
	COMMIT;
END
$$;

CALL add_customer (1,'Dewayne Johnson', 'TheRock@gmail.com', 'Cleaning')

CALL add_customer (2,'Micheal B. Jordan', 'Creed@yahoo.com', 'Service')

CALL add_customer (3,'Zendaya Coleman', 'shakeitup@gmail.com', 'Service')

SELECT*
FROM customer 

-- Customer Procedure 

-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- Invoice Procedure

CREATE OR REPLACE PROCEDURE add_invoice (
	invoice_id INTEGER,
	name TEXT,
	payment NUMERIC,
	service TEXT,
	mechanic TEXT,
	car_name TEXT,
	salesperson TEXT
)
LANGUAGE plpgsql
AS
$$
BEGIN
	INSERT INTO invoice (
	invoice_id,
	name,
	payment,
	service,
	mechanic,
	car_name,
	salesperson
	) VALUES (
	invoice_id,
	name,
	payment,
	service,
	mechanic,
	car_name,
	salesperson
	);
	COMMIT;
END
$$;

CALL add_invoice (1, 'Dewayne Johnson'::text, 1100.93, 'Cleaning'::text , 'Kanye West'::text, 'Ford Fusion'::text, 'Jimmy Hendrix'::text)

CALL add_invoice (2,'Micheal B Jordan'::text, 2553.97, 'Service'::text,'Jay Z'::text,'Ford Bronco'::text,'Brittany howard'::text)

CALL add_invoice (3,'Zendaya Coleman'::text, 1587.15, 'Service'::text,'Jamie Fox'::text,'Ford Ranger'::text,'Eric clapton'::text)

SELECT*
FROM invoice
-- invoice Procedure

-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- History Procedure


SELECT*
FROM history



CREATE PROCEDURE add_history(
	customer_id INTEGER,
	invoice_id INTEGER,
	mechanic_id INTEGER,
	salesperson_id INTEGER,
	ticket_id INTEGER,
	car_id INTEGER
)
LANGUAGE plpgsql
AS
$$
BEGIN
	INSERT INTO history (
	customer_id,
	invoice_id,
	mechanic_id,
	salesperson_id,
	ticket_id,
	car_id
) VALUES (
	customer_id,
	invoice_id,
	mechanic_id,
	salesperson_id,
	ticket_id,
	car_id
	); 
	COMMIT;
END
$$;

CALL add_history (1,1,1,1,1,1)

CALL add_history (2,2,2,2,2,2)

CALL add_history (3,3,3,3,3,3)

SELECT*
FROM history 

-- History Procedure

SELECT *
FROM history 
WHERE invoice_id = 1

