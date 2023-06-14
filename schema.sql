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