/*
 * CREATE SCRIPT
 */
DROP DATABASE IF EXISTS Crm;
CREATE DATABASE Crm;
USE Crm;

CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	username VARCHAR(255),
	is_enabled BOOLEAN DEFAULT TRUE,
	tg_id BIGINT UNIQUE NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


CREATE TABLE resources (
	id INT UNSIGNED UNIQUE NOT NULL AUTO_INCREMENT PRIMARY KEY,
	is_enabled BOOLEAN DEFAULT TRUE,
	name VARCHAR(20)	
);

CREATE TABLE roles (
	id INT UNSIGNED UNIQUE NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(20)
);


CREATE TABLE accounts (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	surname VARCHAR(255),
	role_id INT UNSIGNED NOT NULL,
	phone VARCHAR(255),
	email VARCHAR(255),
	sex VARCHAR(255),
	verified BOOLEAN DEFAULT FALSE,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	
	FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY (id) REFERENCES users(id)
);


CREATE TABLE res_roles (
	id SERIAL PRIMARY KEY,
	role_id INT UNSIGNED NOT NULL,
	resource_id INT UNSIGNED NOT NULL,
	
	FOREIGN KEY (role_id) REFERENCES roles(id),
	FOREIGN KEY (resource_id) REFERENCES resources(id)
);


CREATE TABLE calendars (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	description TEXT,
	user_id BIGINT UNSIGNED NOT NULL,
	
	FOREIGN KEY (user_id) REFERENCES users(id)	
);


CREATE TABLE events (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	description TEXT,
	start_time DATETIME,
	end_time DATETIME,
	calendar_id BIGINT UNSIGNED NOT NULL,
	
	FOREIGN KEY (calendar_id) REFERENCES calendars(id)	
);


CREATE TABLE participants (
	id SERIAL PRIMARY KEY,
	event_id BIGINT UNSIGNED NOT NULL,
	user_id BIGINT UNSIGNED NOT NULL, 
	
	FOREIGN KEY (event_id) REFERENCES events(id),
	FOREIGN KEY (user_id) REFERENCES users(id)
);


CREATE TABLE reminders (
	id SERIAL PRIMARY KEY,
	content TEXT,
	moment DATETIME,
	event_id BIGINT UNSIGNED NOT NULL,
	
	FOREIGN KEY (event_id) REFERENCES events(id)
);


CREATE TABLE recurring_events (
	id SERIAL PRIMARY KEY,
	event_id BIGINT UNSIGNED NOT NULL,
	rtype JSON,
	rparam JSON,
	start_date DATETIME,
	end_date DATETIME,
	
	FOREIGN KEY (event_id) REFERENCES events(id)
);






















