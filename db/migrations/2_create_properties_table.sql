CREATE TABLE properties (id SERIAL PRIMARY KEY, name VARCHAR(100) NOT NULL, description VARCHAR(200) NOT NULL, price NUMERIC(10, 2) NOT NULL);
ALTER TABLE properties ADD COLUMN available_from DATE;
ALTER TABLE properties ADD COLUMN available_to DATE;