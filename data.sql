INSERT INTO animals VALUES (1, 'Agumon', '2020-02-03', 0, true, 10.23),
 (2, 'Gabumon', '2018-11-15', 2, true, 8),
 (3, 'Pikachu', '2021-01-07', 1, false, 15.04),
  (4, 'Devimon', '2017-05-12', 5, true, 11) ;

--   second  day exercise
-- insert the following
INSERT INTO animals VALUES (5, 'Charmander', '2020-02-08', 0, false, -11),
 (6, 'Plantmon', '2021-11-15', 2, true, -5.7),
 (7, 'Squirtle', '1993-04-02', 3, false, -12.13),
  (8, 'Angemon', '2005-06-12', 1, true, -45),
  (9, 'Boarmon', '2005-06-07', 7, true, 20.4),
  (10, 'Blossom', '1998-10-13', 3, true, 17),
  (11, 'Ditto', '2022-05-14', 4, true, 22) ;


-- day 3
-- Insert the following data into the owners table:
INSERT INTO owners (full_name, age) 
VALUES ('Sam Smith', 34),
 ('Jennifer Orwell', 19),
  ('Bob', 45),
  ('Melody Pond', 77),
  ('Dean Winchester', 14),
  ('Jodie Whittaker', 38);

-- Insert the following data into the species table:

INSERT INTO species (name)
VALUES ('Pokemon'),
('Digomon');


-- Modify your inserted animals so it includes the species_id value:

UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE species_id IS NULL;

-- Modify your inserted animals to include owner information (owner_id):
UPDATE animals SET owners_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owners_id = 2 WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owners_id = 3 WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owners_id = 4 WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owners_id = 5 WHERE name IN ('Angemon', 'Boarmon');


-- day 4
INSERT INTO vets (name, age, date_of_graduaction) VALUES 
('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'), 
('Jack Harkness', 38, '2008-06-08');    

INSERT INTO specializations (species_id, vets_id) VALUES 
(1, 1), 
(2, 3), 
(1, 3), 
(2, 4);

INSERT INTO visits (animals_id, vets_id, visit_date) VALUES 
(1, 1, '2020-05-24'),
(1, 3, '2020-07-22'),
(2, 4, '2021-02-02'),
(5, 2, '2020-01-05'),
(5, 2, '2020-03-08'),
(5, 2, '2020-05-14'),
(3, 3, '2021-05-04'),
(9, 4, '2021-02-24'),
(7, 2, '2019-12-21'),
(7, 1, '2020-08-10'),
(7, 2, '2021-04-07'),
(10, 3, '2019-09-29'),
(8, 4, '2020-10-03'),
(8, 4, '2020-11-04'),
(4, 2, '2019-01-24'),
(4, 2, '2019-05-15'),
(4, 2, '2020-02-27'),
(4, 2, '2020-08-03'),
(6, 3, '2020-05-24'),
(6, 1, '2021-01-11');