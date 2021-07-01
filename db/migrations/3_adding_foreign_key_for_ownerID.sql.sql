ALTER TABLE properties ADD COLUMN available_from DATE;
ALTER TABLE properties ADD COLUMN available_to DATE;
ALTER TABLE properties ADD owner_id int;
ALTER TABLE properties ADD FOREIGN KEY (owner_id) REFERENCES users(id);