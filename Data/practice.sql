CREATE TABLE cities(
	id SERIAL PRIMARY KEY,
	name VARCHAR(30),
	state VARCHAR(2),
);

CREATE TABLE IF NOT EXISTS people (
  name VARCHAR(30) NOT NULL,
  has_pet BOOLEAN DEFAULT false,
  pet_type VARCHAR(10) NOT NULL,
  pet_name VARCHAR(30),
  pet_age INT
);

-- Query all fields from the table
SELECT * FROM people;

-- Insert data into the table
INSERT INTO people (name, has_pet, pet_type, pet_name, pet_age)
VALUES ('Jacob', true, 'dog', 'Misty', 10),
  ('Ahmed', true, 'rock', 'Rockington', 100),
  ('Peter', true, 'cat', 'Franklin', 2),
  ('Dave', true, 'dog', 'Queso', 1);

SELECT * FROM people WHERE (pet_type='Dog' and pet_age>2) OR name='Ahmed';

DELETE FROM people WHERE name='Ahmed';