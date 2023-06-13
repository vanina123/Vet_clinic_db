-- Find all animals whose name ends in "mon".
SELECT * FROM animals WHERE name Like '%mon';
-- List the name of all animals born between 2016 and 2019.
 SELECT name from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
-- List the name of all animals that are neutered and have less than 3 escape attempts.
  SELECT name FROM animals WHERE neutred = true AND escape_attemps < 3;

--   List the date of birth of all animals named either "Agumon" or "Pikachu".
 SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu' ;
-- List name and escape attempts of animals that weigh more than 10.5kg
 SELECT name, escape_attemps FROM animals WHERE weight_kg > 10.5 ;

--  Find all animals that are neutered.
 SELECT * FROM animals WHERE neutred = true ;

--  Find all animals not named Gabumon.
 SELECT * FROM animals WHERE name NOT LIkE 'Gabumon' ;

--  Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3 ;