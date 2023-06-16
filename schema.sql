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

CREATE TABLE owners (
    id serial PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    age INT
);
-- Create a table named species with the following columns:

CREATE TABLE species (
    id serial PRIMARY KEY,
    name VARCHAR(255) not null
);

-- Modify animals table:

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

-- day 4
CREATE TABLE vets (
    id serial PRIMARY KEY,
    name VARCHAR not null,
    age int,
    date_of_graduaction DATE
);


CREATE TABLE specializations (
    vets_id int,
    species_id int,
    CONSTRAINT fk_vets FOREIGN KEY(vets_id) REFERENCES vets(id),
    CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id),
    PRIMARY KEY(vets_id, species_id)
);
CREATE TABLE visits (
    vets_id int,
    animals_id int,
    visit_date date,
    CONSTRAINT fk_vets FOREIGN KEY(vets_id) REFERENCES vets(id),
    CONSTRAINT fk_animals FOREIGN KEY(animals_id) REFERENCES animals(id),
    PRIMARY KEY(vets_id, animals_id, visit_date)
);