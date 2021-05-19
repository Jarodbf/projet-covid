ALTER PROCEDURE sp_writeTest(personne INTEGER, resultat BIT, effect DATE, expiration DATE)
BEGIN
    INSERT INTO tbTest
        (idPersonne, resultaTest, testEffect,testExpiration)
        VALUES 
        (personne, resultat, effect, expiration);
END;
