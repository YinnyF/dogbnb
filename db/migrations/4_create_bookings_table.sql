CREATE TABLE bookings (id SERIAL PRIMARY KEY, property_id int, renter_id int, owner_id int );

ALTER TABLE bookings ADD FOREIGN KEY (property_id) REFERENCES properties(id);
ALTER TABLE bookings ADD FOREIGN KEY (renter_id) REFERENCES users(id);
ALTER TABLE bookings ADD FOREIGN KEY (owner_id) REFERENCES users(id);