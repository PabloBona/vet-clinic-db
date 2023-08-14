/*Queries that provide answers to the questions from all projects.*/

SELECT name FROM animals WHERE name LIKE '%mon'; 
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = TRUE AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name,escape_attempts FROM animals WHERE weight_kg < 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name NOT LIKE 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

-- Setting the species column to unspecified, verify that the column was added correctly. And roolback the changes.
BEGIN;
SAVEPOINT sp1;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK TO sp1;
SELECT * FROM animals;
COMMIT;
-- Setting the species column to digimon and pokemon, verify that the column was added correctly. And commit the changes.
BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
SELECT * FROM animals;
COMMIT;
SELECT * FROM animals;

-- Delete all the rows from the animals table. Verify that the rows were deleted correctly. And roolback the changes.
BEGIN;
SAVEPOINT sp1;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK TO sp1;
SELECT * FROM animals;

-- Delete animals born after 2022-01-01. Add a savepoint, update all animals' weight to be their weight multiplied by -1, rollback to the savepoint, 
-- update all animals' weights that are negative to be their weight multiplied by -1, and commit the changes.
BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT sp1;
UPDATE animals SET weight_kg = weight_kg * -1;
SELECT * FROM animals;
ROLLBACK TO sp1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
SELECT * FROM animals;
COMMIT;

--Write queries to answer the following questions
SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;

SELECT neutered, SUM(escape_attempts) AS total_escape_attempts
FROM animals
GROUP BY neutered;

SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight
FROM animals
GROUP BY species;

SELECT species, AVG(escape_attempts) AS avg_escape_attempts
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;
