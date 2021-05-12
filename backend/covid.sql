CREATE TABLE tbPersonne (
    idPersonne INTEGER NOT NULL DEFAULT AUTOINCREMENT,
    nomPersonne VARCHAR(30) not NULL,
    prenomPersonne VARCHAR(30) not NULL,
    naissanceDate DATE not NULL,
    constraint pk_tbPersonne primary KEY (idPersonne)
);
----------------------------
select *
FROM tbVille
----------------------------
SELECT *
FROM tbCp
----------------------------

CREATE TABLE tbVille (
    idVille INTEGER NOT NULL DEFAULT AUTOINCREMENT,
    nomVille VARCHAR(30) not NULL,
    constraint pk_tbVille primary KEY (idVille)
);

CREATE TABLE tbTest (
    idPersonne INTEGER NOT NULL,
    testDate DATE not NULL,
    expiration DATE not NULL,
    resultaTest BIT NULL,
    idVille INTEGER NOT NULL,
    visitDate DATE not NULL,
    CONSTRAINT fk_tbTest_tbPersonne FOREIGN key (idPersonne) REFERENCES tbPersonne (idPersonne),
    CONSTRAINT fk_tbTest_tbVille FOREIGN key (idVille) REFERENCES tbVille (idVille)
);

CREATE TABLE tbCp (
    idVille INTEGER NOT NULL,
    cpVille INTEGER NOT NULL,
    CONSTRAINT fk_tbCp_tbVille FOREIGN key (idVille) REFERENCES tbVille (idVille)
);

INSERT INTO tbVille
      (nomVille)           
      VALUES
      ('Bruges');
--------------------------------------------

ALTER PROCEDURE sp_getVille()
RESULT (cpVille INTEGER, nomVille char(30))
BEGIN
    SELECT tbCp.cpVille, nomVille
    FROM tbVille join tbCp on tbVille.idVille = tbCp.idVille
END;

---------------------------------------

INSERT INTO tbCp
      (idVille, cpVille)           
      VALUES
      (whatVilleId(), 8200);

------------------------------------------

ALTER FUNCTION whatVilleId() // nom de la fonction et paramètre(s) reçu(s) en INput avec son type
RETURNS INTEGER                              // type du retour
BEGIN
    DECLARE counterVille INTEGER;
    SET counterVille = (
    SELECT count(idVille)
    FROM tbVille
    );
RETURN counterVille;
END;

-----------------------------------

SELECT whatVilleId()

---------------------------------

DELETE tbVille
      WHERE idVille = 8;

--------------------------------------

ALTER PROCEDURE sp_writeVille(ville char(30), codePostal INTEGER)
BEGIN 
    INSERT INTO tbVille
      (idVille, nomVille)
       VALUES 
       (whatVilleId() + 1,ville);
    INSERT INTO tbCp
      (idVille, cpVille)           
      VALUES
      (whatVilleId(), codePostal);
END;


call sp_writeVille('Gand', 9000)



















