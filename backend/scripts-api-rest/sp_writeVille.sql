ALTER PROCEDURE sp_writeVille(ville char(30), codePostal INTEGER)
BEGIN 
    INSERT INTO tbVille
      (nomVille, villeCp)
       VALUES 
       (ville, codePostal);

END;


call sp_writeVille('Gand', 9000)

-------------------------------------