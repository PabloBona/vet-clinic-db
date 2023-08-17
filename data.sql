/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES 
('Agumon', '2020-02-03', 0, true, 10.23),
('Gabumon', '2018-11-15', 2, true, 8),
('Pikachu', '2021-07-01', 1, false, 15.04),
('Devimon', '2017-05-12', 5, true, 11);

-- SELECT * FROM animals; To check if data was inserted correctly.


-- query and update animals table
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES 
('Charmander', '2020-02-08', 0, false, -11),
('Plantmon', '2020-02-08', 2, true, -5.7),
('Squirtle', '2020-02-08', 3, false, -12.13),
('Angemon', '2005-07-12',1, true, -45),
('Boarmon', '2005-07-06', 7, true, 20.4),
('Blossom', '1998-10-13', 3, true, 17),
('Ditto', '2022-05-14', 5, true, 22);
-- SELECT * FROM animals; To check if data was inserted correctly.

--
INSERT INTO owners (full_name, age)
VALUES
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

INSERT INTO species (name)
VALUES
('Pokemon'),
('Digimon');

-- Update animals table with species
UPDATE animals
SET species_id = species.id
FROM species
WHERE animals.name LIKE '%mon'
AND species.name = 'Digimon';

UPDATE animals
SET species_id = species.id
FROM species
WHERE animals.name NOT LIKE '%mon'
AND species.name = 'Pokemon';

-- Update animals table with owners
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith')
WHERE name IN ('Agumon');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
WHERE name IN ('Gabumon');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
WHERE name IN ('Pikachu');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob')
WHERE name IN ('Devimon');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob')
WHERE name IN ('Plantmon');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond')
WHERE name IN ('Charmander');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond')
WHERE name IN ('Squirtle');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond')
WHERE name IN ( 'Blossom');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
WHERE name IN ('Angemon');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
WHERE name IN ('Boarmon');

--4 
-- Insert data into vets table 
INSERT INTO vets (name,age,date_of_graduation)
VALUES
('William Tatcher', 45, '2000-4-23'),
('Maisy Smith', 26, '2019-1-17'),
('Stephanie Mendez', 64, '1981-5-4'),
('Jack Harkness', 38, '2008-6-8');