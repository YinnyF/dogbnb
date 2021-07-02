CREATE TABLE properties (id SERIAL PRIMARY KEY, name VARCHAR(100) NOT NULL, description VARCHAR(200) NOT NULL, price NUMERIC(10, 2) NOT NULL);

ALTER TABLE properties ADD COLUMN available_from DATE;
ALTER TABLE properties ADD COLUMN available_to DATE;
ALTER TABLE properties ADD owner_id int;
ALTER TABLE properties ADD image_route VARCHAR(250);
ALTER TABLE properties ADD FOREIGN KEY (owner_id) REFERENCES users(id);
