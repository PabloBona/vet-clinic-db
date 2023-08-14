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
