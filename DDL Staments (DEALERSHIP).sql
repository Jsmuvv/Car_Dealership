CREATE TABLE salesperson (
	salesperson_id SERIAL PRIMARY KEY NOT NULL,
	name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE customer (
	customer_id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	service_id VARCHAR (100)
);

CREATE TABLE car (
	car_id SERIAL PRIMARY KEY,
	make_id VARCHAR(50) NOT NULL,
	model_id VARCHAR(50) NOT NULL,
	year INTEGER NOT NULL,
	serial_number TEXT NOT NULL UNIQUE
);

CREATE TABLE ticket (
	ticket_id SERIAL PRIMARY KEY,
	Service VARCHAR(50)
);

CREATE TABLE Invoice (
	invoice_id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	payment INTEGER NOT NULL,
	service VARCHAR(100),
	mechanic VARCHAR(50)
);

CREATE TABLE mechanic (
	mechanic_id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	date VARCHAR NOT NULL,
	time_completed INTEGER NOT NULL
);

ALTER TABLE car 
ADD COLUMN salesperson_name VARCHAR(50);

ALTER TABLE invoice 
ADD COLUMN car_name VARCHAR(50);

ALTER TABLE invoice 
ADD COLUMN salesperson VARCHAR(50);

CREATE TABLE history (
	customer_id SERIAL NOT NULL,
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE,
	invoice_id SERIAL NOT NULL,
	FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id) ON DELETE CASCADE,
	mechanic_id SERIAL NOT NULL,
	FOREIGN KEY (mechanic_id ) REFERENCES mechanic(mechanic_id ) ON DELETE CASCADE,
	salesperson_id SERIAL NOT NULL,
	FOREIGN KEY (salesperson_id) REFERENCES salesperson(salesperson_id) ON DELETE CASCADE,
	ticket_id SERIAL NOT NULL,
	FOREIGN KEY (ticket_id ) REFERENCES ticket(ticket_id ) ON DELETE CASCADE,
	car_id SERIAL NOT NULL,
	FOREIGN KEY (car_id) REFERENCES car(car_id) ON DELETE CASCADE
);

ALTER TABLE mechanic 
DROP COLUMN date;

ALTER TABLE mechanic 
DROP COLUMN time_completed;

ALTER TABLE car 
DROP COLUMN salesperson_name;

ALTER TABLE car 
DROP COLUMN serial_number;

ALTER TABLE car 
ADD COLUMN serial_number TEXT;