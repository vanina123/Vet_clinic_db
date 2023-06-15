CREATE TABLE animals (
    id int not null,
    name VARCHAR not null,
    date_of_birth DATE,
    escape_attemps INT,
    neutred BOOLEAN,
    weight_kg DECIMAL
);
-- day 2
-- Add a column species of type string to your animals table. Modify your schema.sql file.
ALTER TABLE animals ADD species VARCHAR(255);

CREATE TABLE animals (
    id int not null,
    name VARCHAR not null,
    date_of_birth DATE,
    escape_attemps INT,
    neutred BOOLEAN,
    weight_kg DECIMAL,
    species VARCHAR(255)
);

-- day 3
-- Create a table named owners with the following columns:
-- id: integer (set it as autoincremented PRIMARY KEY)
-- full_name: string
-- age: integer
CREATE TABLE owners (
    id serial PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    age INT
);
-- Create a table named species with the following columns:
-- id: integer (set it as autoincremented PRIMARY KEY)
-- name: string
CREATE TABLE species (
    id serial PRIMARY KEY,
    name VARCHAR(255) not null
);

-- Modify animals table:
-- Make sure that id is set as autoincremented PRIMARY KEY
-- Remove column species
-- Add column species_id which is a foreign key referencing species table
-- Add column owner_id which is a foreign key referencing the owners table

ALTER TABLE animals DROP id;
ALTER TABLE animals ADD id serial PRIMARY key;
ALTER TABLE animals DROP species;
ALTER TABLE animals ADD species_id int;
ALTER TABLE animals ADD CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id);
ALTER TABLE animals ADD owners_id int;
ALTER TABLE animals ADD CONSTRAINT fk_owners FOREIGN KEY(owners_id) REFERENCES owners(id);

CREATE TABLE animals (
    id serial PRIMARY KEY,
    name VARCHAR not null,
    date_of_birth DATE,
    escape_attemps INT,
    neutred BOOLEAN,
    weight_kg DECIMAL,
    species_id INT,
    owners_id INT,
    CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id),
    CONSTRAINT fk_owners FOREIGN KEY(owners_id) REFERENCES owners(id)
);