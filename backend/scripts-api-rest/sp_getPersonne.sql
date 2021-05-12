--------------------------------------
ALTER PROCEDURE sp_getPersonne()
    RESULT (idPersonne INTEGER, nomPersonne VARCHAR(30), prenomPersonne VARCHAR(30), naissanceDate DATE, SEXE char)
    BEGIN
        SELECT idPersonne, nomPersonne, prenomPersonne, naissanceDate, sexe  
        FROM tbPersonne
    END;
--------------------------------------