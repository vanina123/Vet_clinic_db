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

-- day 2 question
-- Inside a transaction update the animals table by setting the species column to unspecified. Verify that change was made. Then roll back the change and verify that the species columns went back to the state before the transaction.
- BEGIN TRANSACTION;
- UPDATE animals SET species = 'unspecified';
- SELECT species FROM animals;
- ROLLBACK;
- SELECT * FROM animals;

-- Inside a transaction:
-- Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.
-- Update the animals table by setting the species column to pokemon for all animals that don't have species already set.
-- Verify that changes were made.
-- Commit the transaction.
-- Verify that changes persist after commit.

- BEGIN TRANSACTION;
- UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
-  UPDATE animals SET species = 'pokemon' WHERE species is null;
- SELECT * FROM animals;
- COMMIT;
- SELECT * FROM animals;

-- Inside a transaction delete all records in the animals table, then roll back the transaction.
- BEGIN TRANSACTION;
- DELETE FROM animals;
- ROLLBACK;
- SELECT * FROM animals;

-- Delete all animals born after Jan 1st, 2022.
-- Create a savepoint for the transaction.
-- Update all animals' weight to be their weight multiplied by -1.
-- Rollback to the savepoint
-- Update all animals' weights that are negative to be their weight multiplied by -1.
-- Commit transaction
- BEGIN TRANSACTION;
- DELETE FROM animals WHERE date_of_birth > '2022-01-01';
- SAVEPOINT SP1;
- UPDATE animals SET weight_kg = weight_kg * -1;
- ROLLBACK TO SP1;
- UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
- COMMIT;
- SELECT * FROM animals;

-- How many animals are there?
- SELECT COUNT(*) FROM animals;

-- How many animals have never tried to escape?
- SELECT COUNT(*) FROM animals WHERE escape_attemps = 0;

-- What is the average weight of animals?
- SELECT AVG(weight_kg) FROM animals;

-- Who escapes the most, neutered or not neutered animals?
SELECT neutred, COUNT(1) AS escape_count FROM animals GROUP BY neutred;

-- What is the minimum and maximum weight of each type of animal?
- SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?

SELECT species, AVG(escape_attemps) AS avg_escape_attemps FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

-- day 3

-- Write queries (using JOIN) to answer the following questions:

-- What animals belong to Melody Pond?
SELECT animals.name 
FROM animals JOIN owners 
ON animals.owners_id = owners.id 
WHERE owners.full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).
SELECT animals.name 
FROM animals JOIN species 
ON animals.species_id = species.id 
WHERE species.name = 'Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT full_name, name 
from owners LEFT JOIN animals 
ON animals.owners_id = owners.id; 

-- How many animals are there per species?
SELECT COUNT(animals.id) 
from animals JOIN species 
ON species.id = animals.species_id 
GROUP BY species_id;

-- List all Digimon owned by Jennifer Orwell.
SELECT animals.name 
FROM animals JOIN owners 
ON animals.owners_id = owners.id 
WHERE owners.full_name = 'Jennifer Orwell' 
AND animals.species_id = 1;

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT animals.name 
FROM animals JOIN owners ON animals.owners_id = owners.id 
WHERE owners.full_name = 'Dean Winchester' 
AND animals.escape_attemps = 0;

-- Who owns the most animals?
SELECT owners.full_name, 
COUNT(animals.id) AS num_animals 
FROM owners LEFT JOIN animals ON owners.id = animals.owners_id 
GROUP BY owners.full_name 
ORDER BY num_animals DESC LIMIT 1;


-- day4
-- Who was the last animal seen by William Tatcher?
SELECT name
FROM animals
JOIN visits ON animals.id = visits.animals_id
WHERE visits.vets_id = 1
ORDER BY visits.visit_date DESC
LIMIT 1;

-- How many different animals did Stephanie Mendez see?
SELECT COUNT(DISTINCT animals.name)
FROM animals
JOIN visits ON animals.id = visits.animals_id
WHERE visits.vets_id = 3;

-- List all vets and their specialties, including vets with no specialties.

 SELECT vets.name, species.name FROM 
    vets LEFT JOIN 
    specializations ON 
    vets.id = specializations.vets_id LEFT JOIN
    species ON specializations.species_id = species.id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
  SELECT animals.name, visits.visit_date FROM 
    animals JOIN 
    visits ON 
    animals.id = visits.animals_id JOIN 
    vets ON 
    visits.vets_id = vets.id WHERE 
    vets.name = 'Stephanie Mendez' AND 
    visits.visit_date BETWEEN 
    '2020-04-01' AND 
    '2020-08-30';

-- What animal has the most visits to vets?
   SELECT animals.name, COUNT(visits.animals_id) FROM 
    animals JOIN 
    visits ON 
    animals.id = visits.animals_id GROUP BY 
    animals.name ORDER BY 
    COUNT(visits.animals_id) DESC LIMIT 1;


-- Who was Maisy Smith's first visit?
SELECT animals.name, visits.visit_date FROM 
    animals JOIN 
    visits ON 
    animals.id = visits.animals_id JOIN
    vets ON 
    visits.vets_id = vets.id WHERE 
    vets.name = 'Maisy Smith' ORDER BY 
    visits.visit_date ASC LIMIT 1 ;

-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT animals.name AS animals_name, vets.name AS vets_name, visits.visit_date
FROM animals
JOIN visits ON animals.id = visits.animals_id
JOIN vets ON visits.vets_id = vets.id
ORDER BY visits.visit_date DESC
LIMIT 1;

--How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(*) AS num_visits
FROM visits
JOIN animals ON visits.animals_id = animals.id
JOIN vets ON visits.vets_id = vets.id
JOIN specializations ON vets.id = specializations.vets_id
JOIN species ON animals.species_id = species.id
WHERE species.id != specializations.species_id;

--What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT species.name AS sp
FROM visits
JOIN animals ON visits.animals_id = animals.id
JOIN vets ON visits.vets_id = vets.id
JOIN specializations ON vets.id = specializations.vets_id
JOIN species ON animals.species_id = species.id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name
ORDER BY COUNT(*) DESC
LIMIT 1;