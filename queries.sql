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

--3 - Write queries to answer the following questions
--What animals belong to Melody Pond?
SELECT * from animals
INNER JOIN owners ON owners.id = animals.owner_id
WHERE owners.full_name LIKE 'Melody%';

--List of all animals that are pokemon (their type is Pokemon).
SELECT * from animals
INNER JOIN species ON species.id = animals.species_id
WHERE species.name = 'Pokemon';

--List all owners and their animals, remember to include those that don't own any animal.
SELECT full_name, name from owners
LEFT JOIN animals ON animals.owner_id = owners.id;

--How many animals are there per species?
SELECT species.name, COUNT(animals.id) 
FROM species
LEFT JOIN animals ON species.id = animals.species_id
GROUP BY species.id;

--List all Digimon owned by Jennifer Orwell.
SELECT animals.name 
from animals
JOIN owners ON owners.id = animals.owner_id
JOIN species ON species.id = animals.species_id
WHERE animals.owner_id = 8
AND animals.species_id = 2;

--List all animals owned by Dean Winchester that haven't tried to escape.
SELECT animals.name
FROM animals
JOIN owners ON owners.id = animals.owner_id
WHERE escape_attempts = 0
AND owner_id = 11;

--Who owns the most animals?
SELECT COUNT(owner_id) as most_animals, owners.full_name
from animals
JOIN owners ON owners.id = animals.owner_id
GROUP BY owners.full_name ORDER BY most_animals DESC
LIMIT 1;