/* Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic;
-- \c vet_clinic To connect to the database.
CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name varchar(100),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg FLOAT
);
-- \d animals To check if table was created correctly.

-- 2° Query and update animals table
ALTER TABLE animals ADD COLUMN species VARCHAR(50);
-- \d animals To check if column was added correctly.

-- 3° add some new tables and add foreign key columns to your existing animals table to model one-to-many relationships
CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(50),
    age INT);

CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50));

ALTER TABLE animals ADD species_id INT, ADD owner_id INT, DROP COLUMN species;

ALTER TABLE animals
ADD CONSTRAINT fk_animals_species
FOREIGN KEY (species_id) REFERENCES species(id);

ALTER TABLE animals
ADD CONSTRAINT fk_animals_owners
FOREIGN KEY (owner_id) REFERENCES owners(id);



