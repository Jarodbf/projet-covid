CREATE TABLE tbPersonne (
    idPersonne INTEGER NOT NULL DEFAULT AUTOINCREMENT,
    nomPersonne VARCHAR(30) not NULL,
    prenomPersonne VARCHAR(30) not NULL,
    naissanceDate DATE not NULL,
    sexePersonne CHAR not NULL,
    constraint pk_tbPersonne primary KEY (idPersonne)
);
----------------------------
ALTER TABLE tbPersonne 
    ADD sexe CHAR not NULL

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
----------------------------
ALTER TABLE tbVille 
    ADD villeCp INTEGER NOT NULL
---------------------------
CREATE TABLE tbTest (
    idTest INTEGER NOT NULL DEFAULT AUTOINCREMENT,
    idPersonne INTEGER NOT NULL,
    testEffect DATE NOT NULL,
    testExpiration DATE NOT NULL,
    resultaTest BIT NOT NULL,
    CONSTRAINT fk_tbTest_tbPersonne FOREIGN key (idPersonne) REFERENCES tbPersonne (idPersonne),
);
-------------------------------------------------
CREATE TABLE tbVisite (
    idVisite INTEGER NOT NULL DEFAULT AUTOINCREMENT,
    idPersonne INTEGER NOT NULL,
    idVille INTEGER NOT NULL,
    dateVisite DATE not NULL,
    CONSTRAINT fk_tbVisite_tbPersonne FOREIGN key (idPersonne) REFERENCES tbPersonne (idPersonne),
    CONSTRAINT fk_tbVisite_tbVille FOREIGN key (idVille) REFERENCES tbVille (idVille)
);
----------------------------------------------
INSERT INTO tbVille
      (nomVille)           
      VALUES
      ('Bruges');
--------------------------------------------

ALTER PROCEDURE sp_getVille()
RESULT (villeCp INTEGER, nomVille char(30))
BEGIN
    SELECT villeCp, nomVille
    FROM tbVille
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
      WHERE idVille = 4;

--------------------------------------

ALTER PROCEDURE sp_writeVille(ville VARCHAR(30), codePostal INTEGER)
BEGIN 
    INSERT INTO tbVille
      (nomVille, villeCp)
       VALUES 
       (ville, codePostal);

END;


call sp_writeVille('Gand', 9000)

-------------------------------------

INSERT INTO tbPersonne 
    (nomPersonne, prenomPersonne, naissanceDate, sexe)
    VALUES
    ('Dupre', 'Henri', '1970-02-01','H');
--------------------------------------
select *
FROM tbPersonne
--------------------------------------
ALTER PROCEDURE sp_getPersonne()
    RESULT (idPersonne INTEGER, nomPersonne VARCHAR(30), prenomPersonne VARCHAR(30), naissanceDate DATE, sexePersonne char)
    BEGIN
        SELECT idPersonne, nomPersonne, prenomPersonne, naissanceDate, sexePersonne  
        FROM tbPersonne
    END;
--------------------------------------
call sp_getPersonne()
--------------------------------------
DROP TABLE tbCp
--------------------------------------

ALTER PROCEDURE sp_writePersonne(nom VARCHAR(30), prenom VARCHAR(30), naissance DATE, sexe CHAR)
BEGIN
    INSERT INTO tbPersonne
        (nomPersonne, prenomPersonne, naissanceDate, sexePersonne)
        VALUES 
        (nom, prenom, naissance, sexe);
END;

------------------------------------
select *
FROM tbTest
-----------------------------------
DELETE tbPersonne
      WHERE idPersonne = 1;
-----------------------------------
DROP TABLE tbTest
-------------------------------------
ALTER PROCEDURE sp_writeTest(personne INTEGER, resultat BIT, effect DATE, expiration DATE)
BEGIN
    INSERT INTO tbTest
        (idPersonne, resultaTest, testEffect,testExpiration)
        VALUES 
        (personne, resultat, effect, expiration);
END;




















