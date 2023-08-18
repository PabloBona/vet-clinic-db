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

-- 4 - Write queries to answer the following questions
-- Who was the last animal seen by William Tatcher?
SELECT animals.name
FROM animals
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'William Tatcher'
ORDER BY visits.visit_date DESC
LIMIT 1;

-- How many different animals did Stephanie Mendez see?
SELECT COUNT(DISTINCT animals.id) AS "Animals see by Stephanie Mendez"
FROM animals
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'Stephanie Mendez';

-- List all vets and their specialties, including vets with no specialties.
SELECT vets.name, species.name
FROM vets
LEFT JOIN specializations ON vets.id = specializations.vet_id
LEFT JOIN species ON specializations.species_id = species.id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals.name, visits.visit_date
FROM animals
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'Stephanie Mendez'
    AND visits.visit_date BETWEEN '2020-04-01' AND '2020-08-30';

-- What animal has the most visits to vets?
SELECT animals.name, COUNT(visits.animal_id)
FROM animals
JOIN visits ON animals.id = visits.animal_id
GROUP BY animals.name
ORDER BY COUNT(visits.animal_id) DESC
LIMIT 1;

-- Who was Maisy Smith's first visit?
SELECT vets.name, MIN(visits.visit_date)
FROM vets
JOIN visits ON vets.id = visits.vet_id
JOIN animals ON visits.animal_id = animals.id
WHERE animals.owner_id = 2
GROUP BY vets.name;

-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT animals.name, vets.name, visits.visit_date
FROM animals
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON visits.vet_id = vets.id
ORDER BY visits.visit_date DESC
LIMIT 1;

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(*)
FROM visits
JOIN vets ON visits.vet_id = vets.id
JOIN animals ON visits.animal_id = animals.id
LEFT JOIN specializations ON vets.id = specializations.vet_id AND animals.species_id = specializations.species_id
WHERE specializations.vet_id IS NULL;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT species.name
FROM animals
JOIN species ON animals.species_id = species.id
WHERE animals.owner_id = 2
GROUP BY species.name
ORDER BY COUNT(*) DESC
LIMIT 1;
